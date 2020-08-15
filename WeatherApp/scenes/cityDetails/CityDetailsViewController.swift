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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
