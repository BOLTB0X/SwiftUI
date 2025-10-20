//
//  Menu.swift
//  View_Practice01
//
//  Created by KyungHeon Lee on 10/20/25.
//

import SwiftUI

struct MenuView: View {
    @State var isFavorite = false
    
    var body: some View {
        Menu("Actions") {
            Button {
                // Duplicate action.
            } label: {
                Label("Duplicate", systemImage: "doc.on.doc")
                Text("Duplicate the component")
            }
            Button {
                // Rename action.
            } label: {
                Label("Rename", systemImage: "pencil")
                Text("Rename the component")
            }
            // ===========================
            
            Button("Delete…", systemImage: "trash", role: .destructive) {
                // Delete action.
            }
            
            Toggle(
                "Favorite",
                systemImage: "suit.heart",
                isOn: $isFavorite)
        } // Menu
        .labelStyle(.titleAndIcon)
    }
}

#Preview {
    MenuView()
}
