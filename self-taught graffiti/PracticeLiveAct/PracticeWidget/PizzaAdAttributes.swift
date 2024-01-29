//
//  PizzaAdAttributes.swift
//  PracticeLiveAct
//
//  Created by KyungHeon Lee on 2024/01/29.
//

import SwiftUI
import ActivityKit

struct PizzaAdAttributes: ActivityAttributes {
    public typealias PizzaAdStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var adName: String
        var showTime: Date
    }
    
    var discount: String
}
