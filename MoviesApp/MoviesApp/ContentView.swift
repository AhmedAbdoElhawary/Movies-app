//
//  ContentView.swift
//  MoviesApp
//
//  Created by ahmed elhawary on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedBottomTab = 0

    var body: some View {
        TabView(selection: $selectedBottomTab) {
            
            // 🏠 Home tab
            NavigationStack {
                HomeView() // <- your existing top-tabs screen
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            
            // 🔍 Search tab
            NavigationStack {
                HomeView()
//                    .navigationTitle("Search")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)
            
            // 􀊴 favorite tab
            NavigationStack {
                HomeView()
//                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Favorite", systemImage: "suit.heart")
            }
            .tag(2)
            
            // 👤 Profile tab
            NavigationStack {
                HomeView()
//                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(3)
        }
        .accentColor(Color(#colorLiteral(red: 0.4649023437, green: 0.01878452948, blue: 0.2201587714, alpha: 1))) // active icon color
        
    }
}


#Preview {
    ContentView()
}
