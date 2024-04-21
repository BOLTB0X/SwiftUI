//
//  Workout.swift
//  WorkoutLiveWidgetPOC
//
//  Created by KyungHeon Lee on 2024/04/19.
//

import Foundation

enum Workout: Int, Codable {
    case Jogging = 0
    case Aerobics = 1
    case Yoga = 2
    
    // Workout Icon
    var workoutIcon: String {
        switch self {
        case .Jogging:
            return "figure.run"
        case .Aerobics:
            return "figure.dance"
        case .Yoga:
            return "figure.yoga"
        }
    }
    
    // Workout name
    var workoutName: String {
        switch self {
        case .Jogging:
            return "Jogging"
        case .Aerobics:
            return "Aerobics"
        case .Yoga:
            return "Yoga"
        }
    }
}


