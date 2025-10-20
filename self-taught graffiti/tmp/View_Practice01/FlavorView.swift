//
//  FlavorView.swift
//  View_Practice01
//
//  Created by KyungHeon Lee on 10/20/25.
//

import SwiftUI

struct FlavorView: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }


    @State private var selectedFlavor: Flavor = .chocolate
    @State private var includesToppings: Bool = false
    
    var body: some View {
        Menu("Ice Cream Order 3") {
                Button("Special request") {
                    // Create a special request.
                }
                Toggle("Include toppings", isOn: $includesToppings)
                Picker("Flavor", selection: $selectedFlavor) {
                    Text("🟤")
                        .tag(Flavor.chocolate)
                    Text("⚪️")
                        .tag(Flavor.vanilla)
                    Text("🔴")
                        .tag(Flavor.strawberry)
                }
                .pickerStyle(.palette)
            }
    }
}

#Preview {
    FlavorView()
}
