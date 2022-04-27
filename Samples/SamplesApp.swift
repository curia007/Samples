//
//  SamplesApp.swift
//  Samples
//
//  Created by Carmelo Uria on 4/27/22.
//

import SwiftUI

@main
struct SamplesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
