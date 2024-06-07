//
//  TestCustomFunction.swift
//  Runner
//
//  Created by Mathieu Lima EdgeAngel on 07/06/2024.
//

import Foundation
import GoogleTagManager

@objc(TestEventTag)
final class TestEventTag : NSObject, TAGCustomFunction {
    @objc func execute(withParameters parameters: [AnyHashable : Any]!) -> NSObject! {
        let testParamValue = parameters[AnyHashable("test_param")] as? String
        let testParam = testParamValue ?? "(not set)"
        print("it works: test_param = \(testParam)")
        return nil
    }
}

@objc(TestVariable)
final class TestVariable : NSObject, TAGCustomFunction {
    @objc func execute(withParameters parameters: [AnyHashable : Any]!) -> NSObject! {
        let result = "42" as NSString
        return result
    }
}
