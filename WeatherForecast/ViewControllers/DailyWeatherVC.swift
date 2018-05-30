//
//  DailyWeatherVC.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import UIKit

class DailyWeatherVC: UIViewController {
    
    //Properties
    let manager = WeatherDataManager()
    
    //Outlets
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var lowestTemperature: UILabel!
    @IBOutlet weak var highestTemperature: UILabel!
    
}

//MARK:- Life Cycle

extension DailyWeatherVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchCurrentWeather()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Custom Methods

extension DailyWeatherVC {
    
    func fetchCurrentWeather() {
        manager.getDailyWeatherDetails { (error) in
            if let error = error {
                self.showAlert(error.localizedDescription, actions: nil)
                return
            }
            self.initializeView()
        }
    }
    
    private func initializeView() {
        let dailyData = manager.dailyWeatherDetails
        guard let current = dailyData?.currentTemperature, let condition = dailyData?.currentWeather, let lowTemp = dailyData?.lowestTemperature, let highTemp = dailyData?.highestTemperature else {
            return
        }
        currentTemperature.text = String(describing: current) + "°"
        weatherCondition.text = condition
        lowestTemperature.text = String(describing: lowTemp) + "°"
        highestTemperature.text = String(describing: highTemp) + "°"
    }
}
