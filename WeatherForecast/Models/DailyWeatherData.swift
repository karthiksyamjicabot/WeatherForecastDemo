//
//  DailyWeatherData.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import Foundation



struct DailyWeatherData: Decodable {
    var currentTemperature: Int?
    var highestTemperature: Int?
    var lowestTemperature:Int?
    var currentWeather: String?
}

struct WeatherData: Decodable {
    var dailyWeatherData : DailyWeatherData?
}
