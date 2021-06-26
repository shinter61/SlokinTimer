//
//  SlokinTimerApp.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/06/25.
//

import SwiftUI

@main
struct SlokinTimerApp: App {
    @StateObject private var timeHolder = TimeHolder()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timeHolder)
        }
    }
}
