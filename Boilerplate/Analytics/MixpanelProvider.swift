//
//  MixpanelProvider.swift
//  Boilerplate
//
//  Created by Abhinand on 11/11/21.
//

import Foundation
//import Mixpanel

class MixpanelProvider: AnalyticsProvider {
    //let mixpanel = Mixpanel.mainInstance()

    func track(name: String, properties: [String: Any]? = nil) {
        //mixpanel.track(event: name, properties: properties as? Properties)
    }

    func setSuperProperties(properties: [String: Any]?) {
       // mixpanel.registerSuperProperties(properties as! Properties)
    }

    func setPeopleProperties(properties: [String: Any]?) {
        //mixpanel.people.set(properties: properties as! Properties)
    }

    func identify(userId: String) {
        //mixpanel.identify(distinctId: userId)
    }
    
    func reset() {
        //Mixpanel.mainInstance().reset()
    }
}
