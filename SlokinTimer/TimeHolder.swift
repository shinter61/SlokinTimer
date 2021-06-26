//
//  TimeHolder.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/06/25.
//

import Foundation
import SwiftUI

final class TimeHolder: ObservableObject {
    @Published var timer: Timer!
    @Published var current: String = ""
    
    func start() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { _ in
            let currentTime: Date = Date()
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ja_JP")
            formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
            formatter.dateFormat = "yy/MM/dd HH:mm:ss"
            self.current = formatter.string(from: currentTime)
        }
    }
}
