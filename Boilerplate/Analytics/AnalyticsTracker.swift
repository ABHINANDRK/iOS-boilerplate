//
//  AnalyticsTracker.swift
//  Boilerplate
//
//  Created by Abhinand on 11/11/21.
//

import Foundation

struct AnalyticsTracker {
    static var shared = AnalyticsTracker()
    
    var provider: AnalyticsProvider = MixpanelProvider()
    
    
    func trackLogin(){
        provider.track(name: "Login", properties: nil)
    }
    
    func trackRegister(){
        provider.track(name: "Register", properties: nil)
    }
    
    func trackLogout() {
        provider.track(name: "Logout", properties: nil)
    }
}
