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
            Button("Start") { timeHolder.start() }
            Text(String(timeHolder.current))
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimeHolder())
    }
}
