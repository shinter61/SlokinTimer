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
    @Published var startTime: String = ""

    func start() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { _ in
            var calendar = Calendar.current
            calendar.locale = Locale(identifier: "ja_JP")
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ja_JP")
            formatter.dateFormat = "yy/MM/dd HH:mm:ss"
            let currentTime: Date = Date()
            let startTimeDate: Date = formatter.date(from: self.startTime)!
            
            let diffFormatter = DateComponentsFormatter()
            diffFormatter.calendar = calendar
            diffFormatter.unitsStyle = .full

            let timeDiff = calendar.dateComponents([.day, .hour, .minute, .second], from: startTimeDate, to: currentTime)
            self.current = diffFormatter.string(from: timeDiff)!
        }
    }
    
    func set() {
        let currentTime: Date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yy/MM/dd HH:mm:ss"
        self.startTime = formatter.string(from: currentTime)
        self.start()
    }
}
