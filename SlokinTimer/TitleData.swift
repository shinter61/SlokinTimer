//
//  TitleData.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/07/01.
//

import Foundation

final class TitleData: ObservableObject {
    @Published var initTitle: String = "ギャンブル狂"
    @Published var halfDayTitle: String = "限界ギャンブラー"
    @Published var oneDayTitle: String = "意思薄弱ギャンブラー"
    @Published var twoDayTitle: String = "三度目の正直ギャンブラー"
    @Published var threeDayTitle: String = "気まぐれギャンブラー"
    @Published var oneWeekTitle: String = "夢でギャンブルをするギャンブラー"
    @Published var twoWeekTitle: String = "金が貯まり出したギャンブラー"
    @Published var threeWeekTitle: String = "3週間の壁ギャンブラー"
    @Published var oneMonthTitle: String = "最近顔を見ないギャンブラー"
    @Published var twoMonthTitle: String = "ここで行ってほしくないギャンブラー"
    @Published var threeMonthTitle: String = "3ヶ月の壁ギャンブラー"
    @Published var sixMonthTitle: String = "よく続いたギャンブラー"
    @Published var nineMonthTitle: String = "ゴールはもう少しギャンブラー"
    @Published var oneYearTitle: String = "一般人"

    func getTitle() -> String {
        return UserDefaults.standard.string(forKey: "title") ?? ""
    }

    func achieveTitle(span: DateComponents, start: Date, current: Date) {
        let titleData: [String:Bool] = [
            self.initTitle: true,
            self.halfDayTitle: Calendar.current.date(byAdding: .hour, value: -12, to: current)! >= start,
            self.oneDayTitle: Calendar.current.date(byAdding: .day, value: -1, to: current)! >= start,
            self.twoDayTitle: Calendar.current.date(byAdding: .day, value: -2, to: current)! >= start,
            self.threeDayTitle: Calendar.current.date(byAdding: .day, value: -3, to: current)! >= start,
            self.oneWeekTitle: Calendar.current.date(byAdding: .day, value: -7, to: current)! >= start,
            self.twoWeekTitle: Calendar.current.date(byAdding: .day, value: -7*2, to: current)! >= start,
            self.threeWeekTitle: Calendar.current.date(byAdding: .day, value: -7*3, to: current)! >= start,
            self.oneMonthTitle: Calendar.current.date(byAdding: .month, value: -1, to: current)! >= start,
            self.twoMonthTitle: Calendar.current.date(byAdding: .month, value: -2, to: current)! >= start,
            self.threeMonthTitle: Calendar.current.date(byAdding: .month, value: -3, to: current)! >= start,
            self.sixMonthTitle: Calendar.current.date(byAdding: .month, value: -6, to: current)! >= start,
            self.nineMonthTitle: Calendar.current.date(byAdding: .month, value: -9, to: current)! >= start,
            self.oneYearTitle: Calendar.current.date(byAdding: .year, value: -1, to: current)! >= start,
        ]
        for (key, isAchieved) in titleData {
            if (isAchieved) { UserDefaults.standard.set(true, forKey: key) }
        }
        
        var title = ""
        if (span.year! >= 1) { title = self.oneYearTitle }
        else if (span.month! >= 9) { title = self.nineMonthTitle }
        else if (span.month! >= 6) { title = self.sixMonthTitle }
        else if (span.month! >= 3) { title = self.threeMonthTitle }
        else if (span.month! >= 2) { title = self.twoMonthTitle }
        else if (span.month! >= 1) { title = self.oneMonthTitle }
        else if (span.day! >= 7*3) { title = self.threeWeekTitle }
        else if (span.day! >= 7*2) { title = self.twoWeekTitle }
        else if (span.day! >= 7) { title = self.oneWeekTitle }
        else if (span.day! >= 3) { title = self.threeDayTitle }
        else if (span.day! >= 2) { title = self.twoDayTitle }
        else if (span.day! >= 1) { title = self.oneDayTitle }
        else if (span.hour! >= 12) { title = self.halfDayTitle }
        else { title = self.initTitle }
        
        UserDefaults.standard.set(title, forKey: "title")
    }
}
