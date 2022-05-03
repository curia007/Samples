//
//  ContentView.swift
//  Samples
//
//  Created by Carmelo Uria on 4/27/22.
//

import SwiftUI
import CoreData

// Main Screen that utilizes TabView
struct ContentView: View {
    
    var body: some View {
        TabView {
            // iTunes movies service provider item list
            ItemList()
                .tabItem {
                    // Tab description using SF Symbols
                    Label("Films", systemImage: "film")
                }
            // Basic Core Data provider.  Basic note taking
            TableContentsView()
                .tabItem {
                    Label("Notes", systemImage: "doc.text")
                }
        }
    }
}

// ContentView Preview panel
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
