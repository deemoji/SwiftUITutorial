//
//  ContentView.swift
//  LandmarkWatch WatchKit Extension
//
//  Created by Дмитрий Мартьянов on 02.06.2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
