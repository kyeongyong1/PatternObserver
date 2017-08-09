//
//  ViewController.swift
//  PatternObserver
//
//  Created by Gaem on 2017. 7. 19..
//  Copyright © 2017년 KI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherData = WeatherData()
        
        let currentConditions = CurrentConditions()
        let statisticsDisplay = StatisticsDisplay()
        let thirdPartyLibrary = ThirdPartyDisplay()
        
        weatherData.registerObserver(observer: currentConditions)
        weatherData.registerObserver(observer: statisticsDisplay)
        weatherData.registerObserver(observer: thirdPartyLibrary)
        
        weatherData.changedMeasurements(temperature: 37.5, humidity: 65, presure: 1)
        print("")
        weatherData.removeObserver(observer: currentConditions)
        weatherData.changedMeasurements(temperature: 36.5, humidity: 63, presure: 1.2)
        print("")
        weatherData.removeObserver(observer: statisticsDisplay)
        weatherData.changedMeasurements(temperature: 34, humidity: 67, presure: 0.9)
        print("")
    }
    
}

