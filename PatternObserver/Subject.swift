//
//  Subject.swift
//  PatternObserver
//
//  Created by Gaem on 2017. 7. 19..
//  Copyright © 2017년 KI. All rights reserved.
//

import Foundation

protocol Subject {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObserver()
    
}

var NOTIFICATION_CHANGED_MEASUREMENTS = NSNotification.Name(rawValue: "notificationChangedMeasurements")

class WeatherData:Subject {
    
    private(set) var temperature: Double?
    private(set) var humidity: Double?
    private(set) var presure: Double?
    
    func registerObserver(observer: Observer) {
        NotificationCenter.default.addObserver(observer, selector: #selector(Observer.update), name: NOTIFICATION_CHANGED_MEASUREMENTS, object: nil)
    }
    
    func removeObserver(observer: Observer) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    func notifyObserver() {
        var userInfo = [String : Any]()
        
        if temperature != nil { userInfo["temperature"] = temperature }
        if humidity != nil { userInfo["humitidy"] = humidity }
        if presure != nil { userInfo["presure"] = presure }
        
        NotificationCenter.default.post(name: NOTIFICATION_CHANGED_MEASUREMENTS, object: nil, userInfo: userInfo)
    }
    
    func changedMeasurements(temperature: Double, humidity: Double, presure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.presure = presure
        notifyObserver()
    }
}
