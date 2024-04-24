//
//  LockScreenWorkoutLiveActivityView.swift
//  WorkoutLiveWidgetPOC
//
//  Created by KyungHeon Lee on 2024/04/19.
//

import SwiftUI
import ActivityKit
import WidgetKit

// MARK: - LockScreenWorkoutLiveActivityView
struct LockScreenWorkoutLiveActivityView: View {
    let context: ActivityViewContext<WorkoutWidgetAttributes>
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    HStack {
                        Text("\(context.attributes.workout.workoutName)")
                            .font(.custom("Georgia", size: 24, relativeTo: .headline))
                            .italic()
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                    } // HStack
                } // ZStack
                
                VStack {
                    Text(timerInterval: context.state.workoutTimer, countsDown: true)
                        .multilineTextAlignment(.center)
                        .monospacedDigit()
                        .font(.title)
                }
                
                Image(systemName: context.attributes.workout.workoutIcon)
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding()
                
                Spacer()
            } // HStack
            
            Button("Click") {
                
            }
            
            Text("Keep it going!!!")
                .font(.custom("Georgia", size: 14, relativeTo: .headline))
                .italic()
                .foregroundColor(.accentColor)
                .padding()
            
        } // VStack
    } // body
} // View
