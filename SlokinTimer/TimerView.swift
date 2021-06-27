//
//  TimerView.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/06/27.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timeHolder: TimeHolder
    
    var body: some View {
        VStack {
            Text(String(timeHolder.current))
                .gradientForeground(colors: [Color(red: 182/255, green: 123/255, blue: 3/255), Color(red: 240/255, green: 215/255, blue: 8/255)])
                .font(.system(size: 40, weight: .bold, design: .serif))
                .padding()
                .padding(.bottom, 50)
            MaterialButton("スロ禁開始") { timeHolder.set() }
            .frame(width: 180, height: 50)
            .padding(.bottom, 20)
            MaterialButton("リセット") { timeHolder.reset() }
            .frame(width: 180, height: 50)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimeHolder())
    }
}
