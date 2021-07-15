//
//  WeatherModel.swift
//  MetigyNews
//
//  Created by Tarinda on 11/7/21.
//

import Foundation

struct WeatherModel: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
}
