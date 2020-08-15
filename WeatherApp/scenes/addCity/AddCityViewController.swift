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

    // MARK: - LifeCycle
    override func viewDidLoad() {
      super.viewDidLoad()
      setUpUI()
    }
    
    // MARK :- Private Methodes
    private func setUpUI() {
      title = Constants.AddCityViewController.title
      setUpAddButton()
    }

    private func setUpAddButton() {
       navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
     }

    @objc func saveTapped() {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
