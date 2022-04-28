//
//  ContentView.swift
//  Samples
//
//  Created by Carmelo Uria on 4/27/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        TabView {
            ItemList()
                .tabItem {
                    Label("Service", systemImage: "cloud")
                }
            TableContentsView()
                .tabItem {
                    Label("Table", systemImage: "doc.text")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
