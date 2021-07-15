//
//  WeatherViewModel.swift
//  MetigyNews
//
//  Created by Tarinda on 11/7/21.
//

import Foundation

struct WeatherViewModel {
    private let weather: WeatherModel
}

extension WeatherViewModel {
    init(_ weather: WeatherModel) {
        self.weather = weather
    }
}

extension WeatherViewModel {
    var cityName: String {
        return self.weather.name
    }
    
    var temperature: String {
        return formatTemperatureForDisplay(self.weather.main.temp ?? 0.0)
    }
    
    func formatTemperatureForDisplay(_ temperature: Double) -> String {
        let tempValue =  String(format: "%.0f", self.weather.main.temp ?? "0")
        return "\(tempValue)˚C"
    }
}
