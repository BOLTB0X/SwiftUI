//
//  TabItem.swift
//  DynamicTabView
//
//  Created by KyungHeon Lee on 2023/02/23.
//

import Foundation

// model
struct TabItem: Identifiable {
  let id = UUID()
  let name: String
  let image: String
  let tag: Int
}
