//
//  WorkoutWidgetAttributes.swift
//  WorkoutLiveWidgetPOC
//
//  Created by KyungHeon Lee on 2024/04/21.
//

import ActivityKit
import WidgetKit

struct WorkoutWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var workoutTimer: ClosedRange<Date>
    }
    
    var workout: Workout
}
