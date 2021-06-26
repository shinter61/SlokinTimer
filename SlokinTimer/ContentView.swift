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
        }
        .onAppear { timeHolder.start() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimeHolder())
    }
}
