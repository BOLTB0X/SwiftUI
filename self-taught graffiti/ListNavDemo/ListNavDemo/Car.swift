//
//  Car.swift
//  ListNavDemo
//
//  Created by Neil Smyth on 8/7/22.
//

import SwiftUI

struct Car : Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}
