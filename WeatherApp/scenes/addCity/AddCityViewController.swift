//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {
    
    // MARK :- Outlets
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var longitudeTextField: UITextField!
    @IBOutlet private weak var latitudeTextField: UITextField!
    
    // MARK :- Properties
    private let interactor: AddCityUseCase
    
    // MARK: - Initializers
    init(interactor: AddCityUseCase) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    // MARK :- Private Methodes
    private func setUpUI() {
        title = Constants.AddCityViewController.title
        setUpAddButton()
        setUpObservers()
    }
    
    private func setUpAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
    }
    
    @objc func saveTapped() {
        guard let viewModel = AddCityViewModel(name: nameTextField.text, longitude: longitudeTextField.text, latitude: latitudeTextField.text) else {
            print("Bad Args")
            return
        }
        interactor.AddNewCity(name: viewModel.name, longitude: viewModel.longitude, latitude: viewModel.latitude)
    }
    
    private func setUpObservers() {
        interactor.stateObserver.addObserver { [weak self] state in
            self?.updateDisplay(state: state)
        }
    }
    
    private func updateDisplay(state: State) {
        switch state {
        case .success:
            navigationController?.popViewController(animated: true)
        case .error:
            print("Cannot save City")
        }
    }
}
