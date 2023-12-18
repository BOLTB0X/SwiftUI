//
//  TimerAttributes.swift
//  ActivityKit_Tutorial
//
//  Created by lkh on 12/18/23.
//

import Foundation
import ActivityKit

struct TimerAttributes: ActivityAttributes {

  public typealias TimeTrackingStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var duration: String
    var progress: Double
  }

  var name: String
}
