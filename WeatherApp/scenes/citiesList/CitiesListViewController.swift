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
    private let rowHeight: CGFloat = 60.0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.CitiesListViewController.title
        setUpAddButton()
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
    0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}

// MARK: - NavBar
extension CitiesListViewController {
  
  private func setUpAddButton() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
  }

  @objc func addTapped() {
  }
}
