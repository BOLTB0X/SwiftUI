//
//  PracticeWidgetBundle.swift
//  PracticeWidget
//
//  Created by KyungHeon Lee on 2024/01/29.
//

import WidgetKit
import SwiftUI

@main
struct PracticeWidgetBundle: WidgetBundle {
    var body: some Widget {
        PracticeWidget()
        PracticeWidgetLiveActivity()
    }
}

struct PizzaDeliverActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PizzaDeliveryAttributes.self) { context in
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Your \(context.state.driverName) is on the way!")
                            .font(.headline)
                        
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.secondary)
                            
                            HStack(alignment: .center, spacing: 0) {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.blue)
                                    .frame(width: 50)
                                
                                Image(systemName: "shippingbox.circle.fill")
                                    .foregroundColor(.white)
                                    .padding(.leading, -25)
                                
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.white.opacity(0.5))
                                
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white.opacity(0.5))
                                
                                Text(timerInterval: context.state.estimatedDeliveryTime, countsDown: true)
                                    .bold()
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                                    .multilineTextAlignment(.center)
                                
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white.opacity(0.5))
                                
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.white.opacity(0.5))
                                
                                Image(systemName: "house.circle.fill")
                                    .foregroundColor(.green)
                                    .backgroundStyle(.white)
                                    .clipShape(Circle())
                            } // HStack
                        } // ZStack
                    } // VStack
                    Spacer()
                    VStack {
                        Text("\(context.attributes.numberOfPizzas)")
                            .font(.title)
                            .bold()
                        Spacer()
                    } // VStack
                } // HStack
                .padding(5)
                
                Text("You've already paid: \(context.attributes.totalAmount)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 5)
            } // VStack
            .padding(15)
            
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Label("\(context.attributes.numberOfPizzas) Pizzas", systemImage: "bag")
                        .font(.title2)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Label {
                        Text(timerInterval: context.state.estimatedDeliveryTime, countsDown: true)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 50)
                            .monospacedDigit()
                            .font(.caption2)
                    } icon: {
                        Image(systemName: "timer")
                    }
                    .font(.title2)
                }
                
                DynamicIslandExpandedRegion(.center) {
                    Text("\(context.state.driverName) is")
                        .lineLimit(1)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        Link(destination: URL(string: "pizza://TM")!) {
                            Label("Contact driver", systemImage: "phone.circle.fill")
                                .font(.caption)
                                .padding()
                        }
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Spacer()
                        
                        Link(destination: URL(string: "pizza://TM")!) {
                            Label("Cancel Order", systemImage: "phone.circle.fill")
                                .font(.caption)
                                .padding()
                        }
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    } // HStack
                    .padding()
                } // DynamicIslandExpandedRegion
            } compactLeading: {
                Label {
                    Text("\(context.attributes.numberOfPizzas)")
                } icon: {
                    Image(systemName: "bag")
                }
                .font(.caption2)
            } compactTrailing: {
                Text(timerInterval: context.state.estimatedDeliveryTime, countsDown: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 40)
                    .font(.caption2)
                
            } minimal: {
                VStack(alignment: .center) {
                    Image(systemName: "timer")
                    Text(timerInterval: context.state.estimatedDeliveryTime, countsDown: true)
                        .multilineTextAlignment(.center)
                        .monospacedDigit()
                        .font(.caption2)
                }
            }
            .keylineTint(.accentColor)
        }
    } // body
}

struct PizzaAdActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PizzaAdAttributes.self) { context in
            HStack {
                let logo = UserDefaults(suiteName: "group.io.startway.iOS16-Live-Activities")?.data(forKey: "pizzaLogo")
                
                if (logo != nil) {
                    Image(uiImage: UIImage(data: logo!)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .cornerRadius(15)
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(context.state.adName)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("Get \(Text(context.attributes.discount).fontWeight(.black).foregroundColor(.blue)) OFF")
                        .bold()
                        .font(.system(size: 25))
                        .foregroundColor(.secondary)
                    
                    Text("when purchase every $500")
                        .font(.callout)
                        .italic()
                        .lineLimit(1)
                }
                .padding(.trailing)
            }
            .padding()
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Label(context.attributes.discount, systemImage: "dollarsign.arrow.circlepath")
                        .font(.title2)
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    Label {
                        Text("Ads")
                            .multilineTextAlignment(.trailing)
                            .frame(width: 50)
                            .monospacedDigit()
                            .font(.caption2)
                    } icon: {
                        Image(systemName: "dollarsign.circle.fill")
                    }
                    .font(.title2)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.adName)
                        .lineLimit(1)
                        .font(.caption)
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    Button("Pay now") {
                        
                    }
                }
            } compactLeading: {
                Label {
                    Text(context.attributes.discount)
                } icon: {
                    Image(systemName: "dollarsign.circle.fill")
                }
                .font(.caption2)
                .foregroundColor(.red)
            } compactTrailing: {
                Text("Due")
                    .multilineTextAlignment(.center)
                    .frame(width: 40)
                    .font(.caption2)
            } minimal: {
                VStack(alignment: .center) {
                    Image(systemName: "dollarsign.circle.fill")
                    Text(context.attributes.discount)
                        .multilineTextAlignment(.center)
                        .monospacedDigit()
                        .font(.caption2)
                }
            }
            .keylineTint(.accentColor)
        } // ActivityConfiguration
        
    } // body
}

@available(iOSApplicationExtension 16.2, *)
struct PizzaDeliveryActivityWidget_Previews: PreviewProvider {
    static let activityAttributes = PizzaDeliveryAttributes(numberOfPizzas: 2, totalAmount: "1000")
    
    static let activityState = PizzaDeliveryAttributes.ContentState(driverName: "food", estimatedDeliveryTime: Date()...Date().addingTimeInterval(15*60))
    
    static var previews: some View {
        activityAttributes
            .previewContext(activityState, viewKind: .content)
            .previewDisplayName("Notification")
        
        activityAttributes
            .previewContext(activityState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Compact")
        
        activityAttributes
            .previewContext(activityState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Expanded")
        
        activityAttributes
            .previewContext(activityState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
    }
}
