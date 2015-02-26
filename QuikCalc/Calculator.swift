//
//  Calculator.swift
//  QuikCalc
//
//  Created by 20062340 on 25/02/2015.
//  Copyright (c) 2015 WIT. All rights reserved.
//

import Foundation


class Calculator{
    
    var _result:Double = 0.0
    
    
    
    
    
    
    // Basic math functions
    func add(num1: Double, num2: Double) -> Double {
        _result = num1 + num2
        return _result
    }
    func sub(num1: Double, num2: Double) -> Double {
        _result = num1 - num2
        return _result
    }
    func mul(num1: Double, num2: Double) -> Double {
        _result = num1 * num2
        return _result
    }
    func div(num1: Double, num2: Double) -> Double {
        _result = num1 / num2
        return _result
    }
    
    func mod(a: Int, b:Int) ->Int{
        return a%b
    }
    
    
    
}