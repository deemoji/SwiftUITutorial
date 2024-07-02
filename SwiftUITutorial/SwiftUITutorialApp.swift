//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by Дмитрий Мартьянов on 01.05.2024.
//

import SwiftUI

@main
struct SwiftUITutorialApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if os(watchOS)
            WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
