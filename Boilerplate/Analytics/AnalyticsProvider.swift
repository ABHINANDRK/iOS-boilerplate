//
//  AnalyticsProvider.swift
//  Boilerplate
//
//  Created by Abhinand on 11/11/21.
//

import Foundation

protocol AnalyticsProvider {
    func track(name: String, properties: [String: Any]?)
    func setSuperProperties(properties: [String: Any]?)
    func setPeopleProperties(properties: [String: Any]?)
    func identify(userId: String)
    func reset()
}

