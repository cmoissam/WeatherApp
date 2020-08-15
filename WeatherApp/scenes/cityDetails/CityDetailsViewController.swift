//
//  CityDetailsViewController.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import UIKit

class CityDetailsViewController: UIViewController {
    
    // MARK :- Outlets
    @IBOutlet private weak var latitudeLabel: UILabel!
    @IBOutlet private weak var longitudeLabel: UILabel!
    @IBOutlet private weak var timeZoneLabel: UILabel!
    @IBOutlet private weak var currentTimeLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var windDegreeLabel: UILabel!
    @IBOutlet private weak var weatherMainLabel: UILabel!
    @IBOutlet private weak var weatherDescriptionLabel: UILabel!
    @IBOutlet private weak var dataProvenanceLabel: UILabel!
    @IBOutlet private weak var weatherIconLabel: UIImageView!
    @IBOutlet private weak var contentScrollView: UIScrollView!
    @IBOutlet private weak var noDataLabel: UILabel!
    
    // MARK :- Properties
    private let interactor: CityWeatherDetailsUseCase
    
    // MARK: - Initializers
    init(interactor: CityWeatherDetailsUseCase) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.getCityWeatherDetails()
    }
    
    // MARK :- Private Methodes
    private func setUpObservers() {
        interactor.viewModel.addObserver(fireNow: true) { [weak self] displayContext in
            self?.updateDisplay(displayContext: displayContext)
        }
    }
    
    private func updateDisplay(displayContext: CityDetailsDisplayContext) {
        switch displayContext {
        case .loading(let name):
            title = name
            contentScrollView.isHidden = true
        case .noData:
            noDataLabel.text = Constants.CityWeatherDetailsViewController.noData
        case .success(let viewModel):
            refreshUI(viewModel: viewModel)
        }
    }
    
    private func refreshUI(viewModel: CityDetailsViewModel) {
        showProvenanceViewWithAnimation(isRemote: viewModel.isRemote)
        contentScrollView.isHidden = false
        latitudeLabel.text = viewModel.latitude
        longitudeLabel.text = viewModel.longitude
        timeZoneLabel.text = viewModel.timeZone
        currentTimeLabel.text = viewModel.currentTime
        temperatureLabel.text = viewModel.temperature
        feelsLikeLabel.text = viewModel.feelsLike
        pressureLabel.text = viewModel.pressure
        humidityLabel.text = viewModel.humidity
        windSpeedLabel.text = viewModel.windSpeed
        windDegreeLabel.text = viewModel.windDegree
        weatherMainLabel.text = viewModel.weatherMain
        weatherDescriptionLabel.text = viewModel.weatherDescription
        weatherIconLabel.image = viewModel.weatherIcon
    }
    
    private func showProvenanceViewWithAnimation(isRemote: Bool) {
        dataProvenanceLabel.backgroundColor = isRemote ? .green : .red
        dataProvenanceLabel.text = isRemote ? Constants.CityWeatherDetailsViewController.remoteData : Constants.CityWeatherDetailsViewController.localData
        UIView.animate(
            withDuration: 0.300,
            delay: 0.0,
            options: [.curveEaseInOut],
            animations: { [weak self] in
                self?.dataProvenanceLabel.isHidden = false
            },
            completion: { [weak self] _ in
                /// Using dispatch instead of animation delay property to keep user interaction when view is shown
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    UIView.animate(
                        withDuration: 0.300,
                        animations: { [weak self] in
                            self?.dataProvenanceLabel.isHidden = true
                        },
                        completion: nil
                    )
                }
            }
        )
    }
}
