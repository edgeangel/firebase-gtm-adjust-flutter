//
//  AdjustCustomFunction.swift
//  Runner
//
//  Created by Mathieu Lima EdgeAngel on 07/06/2024.
//

import Foundation
import GoogleTagManager
import Adjust

@objc(AdjustEventTag)
final class AdjustEventTag: NSObject, TAGCustomFunction {
    
    @objc func execute(withParameters parameters: [AnyHashable : Any]!) -> NSObject! {
        // Print the parameters for troubleshooting
        print(parameters ?? [:])
        
        // Check for and cast "isRevenue" and "event_token" at the beginning
        guard let isRevenueString = parameters["isRevenue"] as? String,
              let isRevenue = Bool(isRevenueString.lowercased()),
              let eventToken = parameters["event_token"] as? String else {
            // Return nil if necessary parameters are missing or conversion fails
            return nil
        }
        
        // Create Adjust Event
        guard let event = ADJEvent(eventToken: eventToken) else {
            // Return nil if Adjust event creation fails
            return nil
        }
        
        // Set revenue if "isRevenue" is true
        if isRevenue {
            guard let purchaseValue = parameters["purchase_value"] as? Double,
                  let currency = parameters["currency"] as? String else {
                // Return nil if necessary revenue parameters are missing
                return nil
            }
            event.setRevenue(purchaseValue, currency: currency)
        }
        
        // Track the event with Adjust
        Adjust.trackEvent(event)
        print("Adjust event fired")
    
        return nil
    }
}
