//
//  LiveActivityManager.swift
//  ActivityKit_Tutorial
//
//  Created by lkh on 12/18/23.
//

import Foundation
import ActivityKit

class LiveActivityManager {

    @discardableResult
    func startActivity(duration: TimeInterval, progress: Double) -> Activity<DynamicIslandWidgetAttributes>? {
        var activity: Activity<DynamicIslandWidgetAttributes>?
        let attributes = DynamicIslandWidgetAttributes(name: "Timer")

        do {
            let state = DynamicIslandWidgetAttributes.ContentState(
                duration: duration.format(using: [.minute, .second]),
                progress: progress
            )
            activity = try Activity<DynamicIslandWidgetAttributes>.request(
                attributes: attributes,
                contentState: state,
                pushType: nil
            )
        } catch {
            print(error.localizedDescription)
        }
        return activity
    }

    func updateActivity(activity: String, duration: TimeInterval, progress: Double) {
        Task {
            let contentState = DynamicIslandWidgetAttributes.ContentState(
                duration: duration.format(using: [.minute, .second]),
                progress: progress
            )
            let activity = Activity<DynamicIslandWidgetAttributes>.activities.first(where: { $0.id == activity })
            await activity?.update(using: contentState)
        }
    }

    func endActivity() {
        Task {
            for activity in Activity<DynamicIslandWidgetAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
}
