//
//  Footer.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/06/29.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        HStack {
            Button(action: {

            }) {
                Text("タイマー")
                    .frame(width: UIScreen.main.bounds.size.width / 3, height: 70, alignment: .center)
                    .padding(-7.0)
            }
            Button(action: {

            }) {
                Text("記録")
                    .frame(width: UIScreen.main.bounds.size.width / 3, height: 70, alignment: .center)
                    .padding(-7.0)
            }
            Button(action: {

            }) {
                Text("称号")
                    .frame(width: UIScreen.main.bounds.size.width / 3, height: 70, alignment: .center)
                    .padding(-7.0)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 70)
        .background(Rectangle().fill(Color.white).shadow(color: .gray, radius: 5, x: 0, y: -2))
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
