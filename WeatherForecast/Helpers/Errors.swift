//
//  CustomError.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import Foundation

//MARK:- Custom Errors

enum Errors: Error{
    case invalidResponse
    case customError(String)
}

extension Errors: LocalizedError{
    
    public var errorDescription: String?{
        
        switch self {

        case .invalidResponse:
            return "Invalid response from server"
            
        case .customError(let message):
            return message
            
        }
    }
}
