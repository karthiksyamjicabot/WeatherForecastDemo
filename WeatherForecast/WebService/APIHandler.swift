//
//  APIHandler.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import UIKit

class APIHandler: NSObject {
    
    //MARK:- Universal Get
    public func get<T: Decodable>(_ fileName: String, responseType: T.Type, completion: @escaping (T?, Error?) -> Void) {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let responseData = try Data(contentsOf: url)
                //                Decode Response into Base Response Model
                guard let baseResponse: T = try? JSONDecoder().decode(responseType, from: responseData) else {
                    completion(nil, Errors.invalidResponse)
                    return
                }
                completion(baseResponse,nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}

