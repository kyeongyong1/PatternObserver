//
//  Observer.swift
//  PatternObserver
//
//  Created by Gaem on 2017. 7. 19..
//  Copyright © 2017년 KI. All rights reserved.
//

import Foundation

@objc protocol Observer {
    func update(notification: Notification)
}

protocol DisplayElement {
    func display(userInfo: [AnyHashable : Any])
}

class ObserverBase: Observer, DisplayElement {
    func update(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        display(userInfo: userInfo)
    }

    func display(userInfo: [AnyHashable : Any]) {
        print("ObserverBase")
    }
}

class CurrentConditions: ObserverBase {

    override func update(notification: Notification) {
        super.update(notification: notification)
    }
    
    override func display(userInfo: [AnyHashable : Any]) {
        print(self)
        
        let userInfoKeys = userInfo.keys
        for key in userInfoKeys {
            guard let userValue = userInfo[key] else { continue }
            print("\(key) : \(userValue)")
        }
    }
}

class StatisticsDisplay: ObserverBase {
    
    var temperatures = [Double]()
    
    override func update(notification: Notification) {
        super.update(notification: notification)
    }
    
    override func display(userInfo: [AnyHashable : Any]) {
        print(self)
        
        guard let userValue = userInfo["temperature"] as? Double else { return }
        temperatures.append(userValue)
        let sumT = temperatures.reduce(0, +)
        let avgT = sumT / Double(temperatures.count)
        print("Min : ", temperatures.min()!, "Max : ", temperatures.max()!, "Avg : ", avgT)
    }
}

class ThirdPartyDisplay: ObserverBase {
    
    override func update(notification: Notification) {
        super.update(notification: notification)
    }
    
    override func display(userInfo: [AnyHashable : Any]) {
        print(self)
        
        print("ThirdPartyDisplay~")
    }
    
}
