//
//  WeeklyWeatherCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import UIKit

struct WeeklyCellModel {
    var currentWeather = ""
    var lowTemperature: Int = 0
    var highTemperature: Int = 0
    var date = ""
    
    init(weatherData: WeeklyWeatherData){
        guard let weather = weatherData.currentWeather, let highTemp = weatherData.highestTemperature, let lowTemp = weatherData.lowestTempeature, let date = weatherData.date else {
            return
        }
        self.currentWeather = weather
        self.lowTemperature = lowTemp
        self.highTemperature = highTemp
        self.date = date
    }
}

class WeeklyWeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var currentWeather: UILabel!
    @IBOutlet weak var lowTemperature: UILabel!
    @IBOutlet weak var highTemperature: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var model: WeeklyCellModel? {
        didSet {
            guard let model = model else { return }
            currentWeather.text = model.currentWeather
            lowTemperature.text = String(model.lowTemperature) + "°"
            highTemperature.text = String(model.highTemperature) + "°"
            date.text = model.date
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = self.frame.width/10
        self.layer.masksToBounds = true
    }

}
