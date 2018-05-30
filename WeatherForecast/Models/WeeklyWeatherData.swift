//
//  WeeklyWeatherData.swift
//  WeatherForecast
//
//  Created by Karthik on 5/30/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import Foundation

struct WeeklyWeatherData: Decodable {
    var currentWeather: String?
    var highestTemperature: Int?
    var lowestTempeature: Int?
    var date: String?
}

struct WeeklyWeather: Decodable {
    var weeklyWeatherData : [WeeklyWeatherData]?
}
