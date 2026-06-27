//
//  ContentView.swift
//  Habbits
//
//  Created by Przemek Hussar on 11/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TimerView()
                .tabItem {
                    Image(systemName: "clock")
                }
            SummaryView()
                .tabItem {
                    Image(systemName: "chart.bar")
                }
            
        }.tint(.yellow)
    }
}

#Preview {
    ContentView()
}
