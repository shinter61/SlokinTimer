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

    func achieveTitle(span: DateComponents) {
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
        

        UserDefaults.standard.set(true, forKey: title)
        UserDefaults.standard.set(title, forKey: "title")
    }
}
