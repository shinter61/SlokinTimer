//
//  ContentView.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/06/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timeHolder: TimeHolder

    var body: some View {
        VStack {
            Text(String(timeHolder.current))
                .padding()
            Button(action: {
                timeHolder.set()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.yellow)
                        .frame(width: 180, height: 50)
                    Text("スロ禁開始")
                        .foregroundColor(.white)
                        .font(.custom("Shippori Mincho", size: 24))
                        .fontWeight(.bold)
                }
            }
        }
//        .onAppear { timeHolder.start() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimeHolder())
    }
}
