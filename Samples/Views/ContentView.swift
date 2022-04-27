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
            TableContentsView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            ServiceView()
                .tabItem {
                    Label("Service", systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
