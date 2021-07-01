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
        GeometryReader { geometry in
            VStack {
                Text("スロ禁タイマー")
                    .font(.system(size: 44, weight: .black, design: .default))
                    .gradientForeground(colors: [.red, .orange, .yellow, .green, .blue, .purple])
                    .padding()
                    .padding(.bottom, 50)
                    .padding(.top, 50)
                TabView {
                    TimerView()
                        .tabItem {
                            VStack {
                                Image(systemName: "timer")
                                Text("タイマー")
                            }
                            .padding()
                        }
                        .tag(1)
                    Records()
                        .tabItem {
                            VStack {
                                Image(systemName: "crown")
                                Text("記録")
                            }
                            .padding()
                        }
                        .tag(2)
                    Titles()
                        .tabItem {
                            VStack {
                                Image(systemName: "text.book.closed")
                                Text("称号")
                            }
                            .padding()
                        }
                        .tag(3)
                }
            }
        }
        .onAppear { timeHolder.start() }
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimeHolder())
    }
}
