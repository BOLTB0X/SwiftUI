//
//  WorkoutLiveWidgetBundle.swift
//  WorkoutLiveWidget
//
//  Created by KyungHeon Lee on 2024/04/19.
//

import WidgetKit
import SwiftUI

@main
struct WorkoutLiveWidgetBundle: WidgetBundle {
    var body: some Widget {
        WorkoutLiveWidget()
        WorkoutLiveWidgetLiveActivity()
    }
}
