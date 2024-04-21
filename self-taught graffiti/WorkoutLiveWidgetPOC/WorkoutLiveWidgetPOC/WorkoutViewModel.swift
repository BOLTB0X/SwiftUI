//
//  WorkoutViewModel.swift
//  WorkoutLiveWidgetPOC
//
//  Created by KyungHeon Lee on 2024/04/21.
//

import Foundation
import ActivityKit

class WorkoutViewModel {
    func startWorkout(workout: Workout) {
        if ActivityAuthorizationInfo().areActivitiesEnabled {
            var future = Calendar.current.date(byAdding: .minute, value: 1, to: Date())!
            future = Calendar.current.date(byAdding: .second, value: 10, to: future)!
            let date = Date.now...future
            
            let initialContentState = WorkoutWidgetAttributes.ContentState(workoutTimer: date)
            let activityAttributes = WorkoutWidgetAttributes(workout: workout)
            
            let activityContent = ActivityContent(state: initialContentState, staleDate: Calendar.current.date(byAdding: .minute, value: 1, to: Date())!)
            
            do {
                _ = try Activity.request(attributes: activityAttributes, content: activityContent)
                print("Requested Workout Live Activity", String(describing:workout.workoutName))
            } catch (let e) {
                print("Error requesting workout Live Activity", e.localizedDescription)
            }
        } else {
            print("Error requesting workout Live Activity.")
        }
    }
    
    func endWorkout() {
        let finalActivityStatus = WorkoutWidgetAttributes.ContentState(workoutTimer: Date.now...Date())
        let finalContent = ActivityContent(state: finalActivityStatus, staleDate: nil)
        
        Task {
            for activity in Activity<WorkoutWidgetAttributes>.activities {
                await activity.end(finalContent, dismissalPolicy: .immediate)
                print("Ending the Live Activity: \(activity.id)")
            }
        }
    }
    
    func anyWorkoutInProgress() -> Bool {
        print(Activity<WorkoutWidgetAttributes>.activities)
        
        for activity in Activity<WorkoutWidgetAttributes>.activities {
            print("the Live Activity: \(activity.id)")
            if activity.activityState == .active {
                print("Active the Live Activity: \(activity.id)")
                return true
            }
        }
        return false
    }
    
    func keepTrackOfWorkoutUpdates() {
        Task {
            for await activity in Activity<WorkoutWidgetAttributes>.activityUpdates {
                print("Workout details: \(activity.attributes)")
            }
        }
    }
}
