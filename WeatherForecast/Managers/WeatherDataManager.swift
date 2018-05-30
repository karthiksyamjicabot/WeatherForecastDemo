//
//  WeatherDataManager.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import Foundation

class WeatherDataManager: NSObject {
  
    let apiHandler = APIHandler()
    var dailyWeatherDetails: DailyWeatherData?
    var hourlyWeatherDetails: [HourlyWeatherData]?
    var weeklyWeatherDetails: [WeeklyWeatherData]?
}

extension WeatherDataManager {
    
    func getDailyWeatherDetails(_ completion: @escaping (Error?) -> ()) {
        
        apiHandler.get("DailyWeatherData", responseType: WeatherData.self) { (data, error) in
            if error != nil {
                completion(error)
                return
            }
            guard let dailyData = data?.dailyWeatherData else{
                completion(Errors.invalidResponse)
                return
            }
            self.dailyWeatherDetails = dailyData
            completion(nil)
        }
    }
    
    func getHourlyWeatherDetails(_ completion: @escaping (Error?) -> ()) {
        
        apiHandler.get("HourlyWeatherData", responseType: HourlyWeather.self) { (data, error) in
            if error != nil {
                completion(error)
                return
            }
            guard let hourlyData = data?.hourlyWeatherData else{
                completion(Errors.invalidResponse)
                return
            }
            self.hourlyWeatherDetails = hourlyData
            completion(nil)
        }
    }

    func getWeeklyWeatherDetails(_ completion: @escaping (Error?) -> ()) {
        
        apiHandler.get("WeeklyWeatherData", responseType: WeeklyWeather.self) { (data, error) in
            if error != nil {
                completion(error)
                return
            }
            guard let weeklyData = data?.weeklyWeatherData else{
                completion(Errors.invalidResponse)
                return
            }
            self.weeklyWeatherDetails = weeklyData
            completion(nil)
        }
    }

}
