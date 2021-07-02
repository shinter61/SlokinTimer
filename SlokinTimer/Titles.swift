//
//  Titles.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/07/01.
//

import SwiftUI

struct Titles: View {
    @EnvironmentObject var titleData: TitleData
    var body: some View {
        VStack {
            Text("称号")
            List {
                Group {
                    HStack {
                        Text("最初")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.initTitle) ? titleData.initTitle : "-----")
                    }
                    HStack {
                        Text("半日")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.halfDayTitle) ? titleData.halfDayTitle : "-----")
                    }
                    HStack {
                        Text("1日")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.oneDayTitle) ? titleData.oneDayTitle : "-----")
                    }
                    HStack {
                        Text("2日")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.twoDayTitle) ? titleData.twoDayTitle : "-----")
                    }
                    HStack {
                        Text("3日")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.threeDayTitle) ? titleData.threeDayTitle : "-----")
                    }
                    HStack {
                        Text("1週間")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.oneWeekTitle) ? titleData.oneWeekTitle : "-----")
                    }
                    HStack {
                        Text("2週間")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.twoWeekTitle) ? titleData.twoWeekTitle : "-----")
                    }
                    HStack {
                        Text("3週間")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.threeWeekTitle) ? titleData.threeWeekTitle : "-----")
                    }
                    HStack {
                        Text("1ヶ月")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.oneMonthTitle) ? titleData.oneMonthTitle : "-----")
                    }
                    HStack {
                        Text("2ヶ月")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.twoMonthTitle) ? titleData.twoMonthTitle : "-----")
                    }
                }
                Group {
                    HStack {
                        Text("3ヶ月")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.threeMonthTitle) ? titleData.threeMonthTitle : "-----")
                    }
                    HStack {
                        Text("6ヶ月")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.sixMonthTitle) ? titleData.sixMonthTitle : "-----")
                    }
                    HStack {
                        Text("9ヶ月")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.nineMonthTitle) ? titleData.nineMonthTitle : "-----")
                    }
                    HStack {
                        Text("1年")
                        Spacer()
                        Text(UserDefaults.standard.bool(forKey: titleData.oneYearTitle) ? titleData.oneYearTitle : "-----")
                    }
                }
            }
        }
    }
}

struct Titles_Previews: PreviewProvider {
    static var previews: some View {
        Titles()
            .environmentObject(TitleData())
    }
}
