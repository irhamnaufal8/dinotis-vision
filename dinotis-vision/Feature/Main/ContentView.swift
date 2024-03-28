//
//  ContentView.swift
//  dinotis-vision
//
//  Created by Irham Naufal on 27/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Explore", systemImage: "globe.asia.australia")
                }
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            Text("Booking")
                .tabItem {
                    Label("Booking", systemImage: "calendar")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
