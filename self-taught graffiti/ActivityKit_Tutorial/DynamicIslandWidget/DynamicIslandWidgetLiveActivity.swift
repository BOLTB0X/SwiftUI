//
//  DynamicIslandWidgetLiveActivity.swift
//  DynamicIslandWidget
//
//  Created by lkh on 12/18/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

// MARK: - Views
struct LiveActivityContent: View {
    let state: TimerAttributes.ContentState
    
    var body: some View {
        HStack {
            Button {
                //TODO: End the activity
            } label: {
                Label("Stop", systemImage: "stop.circle")
                    .font(.body.bold())
            }
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.vertical, 8)
            .transition(.identity)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 16) {
                WidgetCircleTimerView(
                    progress: state.progress,
                    duration: state.duration
                )
                
                Text(state.duration)
                    .font(.largeTitle.monospacedDigit())
                    .minimumScaleFactor(0.8)
                    .contentTransition(.numericText())
                    .animation(.spring(response: 0.2), value: state.progress)
            }
            
        }
        .id(state)
        .transition(.identity)
        .padding()
    }
}

@DynamicIslandExpandedContentBuilder
private func expandedContent(state: DynamicIslandWidgetAttributes.ContentState) -> DynamicIslandExpandedContent<some View> {
    DynamicIslandExpandedRegion(.leading) {
        Image(systemName: "timer.circle.fill")
            .resizable()
            .frame(width: 44.0, height: 44.0)
    }
    DynamicIslandExpandedRegion(.center) {
        VStack {
            Text(state.duration + " remaining")
                .font(.title)
                .minimumScaleFactor(0.8)
                .contentTransition(.numericText())
            Spacer()
            Button {
                //TODO: End the activity
            } label: {
                Label("Stop", systemImage: "stop.circle")
                    .font(.body.bold())
            }
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.vertical, 8)
            .lineLimit(1)
        }
        .id(state)
        .transition(.identity)
    }
}

struct DynamicIslandWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var duration: String
        var progress: Double
    }

    var name: String
}

// MARK: - LiveActivity
struct DynamicIslandWidgetLiveActivity: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DynamicIslandWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                expandedContent(state: context.state)
            } compactLeading: {
                Image(systemName: "timer")
                    .transition(.identity)
                    .padding(8)
            } compactTrailing: {
                Text(context.state.duration)
                    .minimumScaleFactor(0.8)
                    .contentTransition(.numericText())
                    .monospacedDigit()
                    .padding(8)
            } minimal: {
                Image(systemName: "timer")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}


//
//#Preview("Notification", as: .content, using: DynamicIslandWidgetAttributes.preview) {
//   DynamicIslandWidgetLiveActivity()
//} contentStates: {
//    DynamicIslandWidgetAttributes.ContentState.smiley
//    DynamicIslandWidgetAttributes.ContentState.starEyes
//}
