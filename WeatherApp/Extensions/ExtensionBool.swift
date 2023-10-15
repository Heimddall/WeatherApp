//
//  ExtensionBool.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 24.09.23.
//

import Foundation

extension Bool {
    init(_ value: Int) {
        if value == 0 {
            self = false
        } else {
            self = true
        }
    }
}
