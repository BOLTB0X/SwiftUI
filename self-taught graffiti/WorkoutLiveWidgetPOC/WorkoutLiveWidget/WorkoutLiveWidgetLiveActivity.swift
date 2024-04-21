//
//  WorkoutLiveWidgetLiveActivity.swift
//  WorkoutLiveWidget
//
//  Created by KyungHeon Lee on 2024/04/19.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WorkoutLiveWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WorkoutWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            LockScreenWorkoutLiveActivityView(context: context)
                .activityBackgroundTint(Color.cyan)
                .activitySystemActionForegroundColor(Color.black)
        } dynamicIsland: { context in
            DynamicIsland {
                
                // Leading - Workout Icon
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: context.attributes.workout.workoutIcon)
                      .foregroundColor(.indigo)
                      .font(.title2)
                }
                
                // Trailing - Countdown timer
                DynamicIslandExpandedRegion(.trailing) {
                    Label {
                      Text(timerInterval: context.state.workoutTimer, countsDown: true)
                          .multilineTextAlignment(.trailing)
                          .frame(width: 50)
                          .monospacedDigit()
                    } icon: {
                        Image(systemName: "timer")
                            .foregroundColor(.indigo)
                    }
                    .font(.title2)
                }
                
                // Center - Workout name
                DynamicIslandExpandedRegion(.center) {
                    Text("\(context.attributes.workout.workoutName)")
                        .lineLimit(1)
                        .foregroundColor(.indigo)
                        .padding()
                }
                
                // Bottom - Stop action button
                DynamicIslandExpandedRegion(.bottom) {
                    Link(destination: URL(string: "workout://stop")!, label: {
                      Label("STOP", systemImage: "xmark")
                        .bold()
                        .padding(6)
                        .foregroundColor(.white)
                        .background(.red)
                        .clipShape(
                          Capsule()
                        )
                      }).environment(\.openURL, OpenURLAction { url in
                        print("The the action to the app with \(url)")
                        return .handled
                      })
                }
            } compactLeading: {
                Text("\(context.attributes.workout.workoutName)")
            } compactTrailing: {
                Text(timerInterval: context.state.workoutTimer, countsDown: true)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 50)
                    .monospacedDigit()
            } minimal: {
                Text(context.state.workoutTimer)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    } // body
}

extension WorkoutWidgetAttributes {
  fileprivate static var preview: WorkoutWidgetAttributes {
    WorkoutWidgetAttributes(workout: .Jogging)
  }
}

extension WorkoutWidgetAttributes.ContentState {
    fileprivate static var jogging: WorkoutWidgetAttributes.ContentState {
      var future = Calendar.current.date(byAdding: .minute, value: 20, to: Date())!
      future = Calendar.current.date(byAdding: .second, value: 10, to: future)!
      let date = Date.now...future
        return WorkoutWidgetAttributes.ContentState(workoutTimer: date)
     }
     
     fileprivate static var running: WorkoutWidgetAttributes.ContentState {
       var future = Calendar.current.date(byAdding: .minute, value: 20, to: Date())!
       future = Calendar.current.date(byAdding: .second, value: 10, to: future)!
       let date = Date.now...future
       return WorkoutWidgetAttributes.ContentState(workoutTimer: date)
     }
}

struct WorkoutLiveWidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = WorkoutWidgetAttributes(workout: Workout.Aerobics)
    static let contentState = WorkoutWidgetAttributes.ContentState(workoutTimer: Date()...(Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 31))!))

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
