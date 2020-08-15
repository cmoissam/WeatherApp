//
//  UIViewController+Extensions.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlertController(title: String, message: String) {
        let attributedTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.red
        ])
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        alert.addAction(UIAlertAction(title: Constants.AlertController.buttonOk, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
