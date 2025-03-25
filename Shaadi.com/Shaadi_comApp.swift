//
//  Shaadi_comApp.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

import SwiftUI

@main
struct Shaadi_comApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
