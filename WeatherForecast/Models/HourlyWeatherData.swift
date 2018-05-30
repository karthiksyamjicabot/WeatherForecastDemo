//
//  HourlyWeatherData.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import Foundation

struct HourlyWeatherData: Decodable {
    var currentWeather: String?
    var temperature: Int?
    var humidity: Int?
    var time: String?
}

struct HourlyWeather: Decodable {
    var hourlyWeatherData : [HourlyWeatherData]?
}
