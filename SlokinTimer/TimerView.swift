//
//  TimerView.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/06/27.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timeHolder: TimeHolder
    @EnvironmentObject var titleData: TitleData
    @Environment(\.managedObjectContext) private var context
    
    var body: some View {
        VStack {
            Spacer()
            Text(String(timeHolder.current))
                .gradientForeground(colors: [Color(red: 182/255, green: 123/255, blue: 3/255), Color(red: 240/255, green: 215/255, blue: 8/255)])
                .font(.system(size: 32, weight: .bold, design: .serif))
                .padding(.bottom, 25)
            Text("称号：\(titleData.getTitle())")
                .padding(.bottom, 15)
            Button(action: {
                timeHolder.set(titleData: titleData)
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .frame(width: 180, height: 50)
                    Text("スロ禁開始")
                }
            }
            .padding(.bottom, 20)
            Button(action: {
                let newRecord = Record(context: context)
                newRecord.id = UUID()
                newRecord.startDate = timeHolder.startTimeDate()
                newRecord.span = timeHolder.current
                if (newRecord.startDate != nil) { try? context.save() }

                timeHolder.reset()
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .frame(width: 180, height: 50)
                    Text("リセット")
                }
            }
            .frame(width: 180, height: 50)
            
            Spacer()

            HStack {
                Spacer()
                Button(action: {
                    if let url = URL(string: "https://shinter61.github.io/slokinTimer.privacyPolicy.html") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("プライバシーポリシー")
                        .font(.system(size: 12))
                }
                .padding()
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimeHolder())
            .environmentObject(TitleData())
    }
}
