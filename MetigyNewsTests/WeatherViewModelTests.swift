//
//  WeatherViewModelTests.swift
//  MetigyNewsTests
//
//  Created by Tarinda on 13/7/21.
//

import XCTest
@testable import MetigyNews

class WeatherViewModelTests: XCTestCase {
    
    private var weather: Weather?
    private var weatherModel: WeatherModel?
    private var weatherViewModel: WeatherViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        self.weather = Weather(temp: 16.85)
        self.weatherModel = WeatherModel(name: "London", main: self.weather!)
        self.weatherViewModel = WeatherViewModel(self.weatherModel!)
    }
    
    func testReturnedTemperatureIsRoundedAndAStringWithCelciusPostFix() {
        
        // given
        let temperature = self.weather?.temp
        
        // when
        let result = self.weatherViewModel?.formatTemperatureForDisplay(temperature!)
        
        // then
        XCTAssertEqual(result, "17˚C")
    }

    override func tearDownWithError() throws {
        self.weather = nil
        self.weatherModel = nil
        self.weatherViewModel = nil
        
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
