//
//  CitiesListViewController.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {
    // MARK :- Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var noDataLabel: UILabel!
    
    // MARK :- Properties
    private let interactor: CitiesListUseCase
    private let coordinator: AppRoutingLogic
    private let rowHeight: CGFloat = 60.0
    // MARK: - Initializers
    
    init(
        interactor: CitiesListUseCase,
        coordinator: AppRoutingLogic
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.CitiesListViewController.title
        setUpAddButton()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.Reusable.reuseIdentifierCityNameCell)
        
        interactor.viewModel.addObserver(fireNow: true) { [weak self] in
            self?.refreshUI(viewModel: $0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.getCitiesName()
    }
    
    // MARK: - Private Methodes
    private func refreshUI(viewModel: CitiesListViewModel) {
        switch viewModel.status {
        case .success:
            tableView.isHidden = false
            tableView.reloadData()
        case .noData:
            noDataLabel.text = Constants.CitiesListViewController.noData
            tableView.isHidden = true
        case .loading:
            tableView.isHidden = true
            break
        }
    }
}

extension CitiesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        interactor.viewModel.value.citiesName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:   Constants.Reusable.reuseIdentifierCityNameCell, for: indexPath)
        cell.textLabel?.text =   interactor.viewModel.value.citiesName[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: - NavBar
extension CitiesListViewController {
    private func setUpAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        coordinator.showAddCityViewController()
    }
}
