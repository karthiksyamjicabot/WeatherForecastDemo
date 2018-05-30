//
//  HourlyWeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import UIKit

struct HourlyCellModel {
    var currentWeather = ""
    var temperature: Int = 0
    var humidity: Int = 0
    var time = ""
    
    init(weatherData: HourlyWeatherData){
        guard let weather = weatherData.currentWeather, let temp = weatherData.temperature, let humidity = weatherData.humidity, let time = weatherData.time else {
            return
        }
        self.currentWeather = weather
        self.temperature = temp
        self.humidity = humidity
        self.time = time
    }
}

class HourlyWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var time: UILabel!
    
    var model: HourlyCellModel? {
        didSet {
            guard let model = model else { return }
            weather.text = model.currentWeather
            temperature.text = String(model.temperature) + "°"
            humidity.text = String(model.humidity) + "%"
            time.text = model.time
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
