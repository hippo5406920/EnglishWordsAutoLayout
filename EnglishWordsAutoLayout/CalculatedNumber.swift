//
//  CalculatedNumber.swift
//  CatCalculator
//
//  Created by Yi-Yun Chen on 2017/11/12.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import Foundation
struct CalculatedNumber {
    var text: String = ""
    var display: String {
        mutating get {
            if !text.isEmpty{
                // 浮點數取於數方法
                let remainder = value.truncatingRemainder(dividingBy: 1)
                if remainder == 0 {
                    text = String(format: "%.0f", value)
                }
                return text
            }
            return ""
        }
    }
    var value: Double {
        get {
            if let val = Double(self.text) {
                return val
            }
            return 0
        }
    }
}
