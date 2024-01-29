//
//  PizzaDeliveryAttributes.swift
//  PracticeLiveAct
//
//  Created by KyungHeon Lee on 2024/01/29.
//

import SwiftUI
import ActivityKit

struct PizzaDeliveryAttributes: ActivityAttributes {
    public typealias PizzaDeliveryStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var driverName: String
        var estimatedDeliveryTime: ClosedRange<Date>
    }
    
    var numberOfPizzas: Int
    var totalAmount: String
}
