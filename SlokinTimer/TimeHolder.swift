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
    
    let startTimeKey = "start_time_key"

    func start(titleData: TitleData) {
        let startString = UserDefaults.standard.string(forKey: self.startTimeKey) ?? ""
        if (startString == "") { return }
        
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { _ in
            var calendar = Calendar.current
            calendar.locale = Locale(identifier: "ja_JP")
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ja_JP")
            formatter.dateFormat = "yy/MM/dd HH:mm:ss"
            let currentTime: Date = Date()
            let startTimeDate: Date = formatter.date(from: startString)!
            
            let diffFormatter = DateComponentsFormatter()
            diffFormatter.calendar = calendar
            diffFormatter.unitsStyle = .full

            let timeDiff = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: startTimeDate, to: currentTime)
            titleData.achieveTitle(span: timeDiff)
            self.current = diffFormatter.string(from: timeDiff)!
        }
    }
    
    func set(titleData: TitleData) {
        let currentTime: Date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yy/MM/dd HH:mm:ss"
        let currentString = formatter.string(from: currentTime)
        UserDefaults.standard.set(currentString, forKey: self.startTimeKey)
        self.start(titleData: titleData)
    }
    
    func reset() {
        UserDefaults.standard.removeObject(forKey: self.startTimeKey)
        self.timer?.invalidate()
    }
    
    func startTimeDate() -> String? {
        let startString = UserDefaults.standard.string(forKey: self.startTimeKey) ?? ""
        if (startString == "") { return nil }
        
        return startString
    }
}
