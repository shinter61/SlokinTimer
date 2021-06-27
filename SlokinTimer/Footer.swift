//
//  Footer.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/06/27.
//

import SwiftUI
import MaterialComponents.MaterialBottomNavigation

struct Footer: UIViewRepresentable {
    func makeUIView(context: Context) -> MDCBottomNavigationBar {
        let bottomNavBar = MDCBottomNavigationBar()
        bottomNavBar.titleVisibility = MDCBottomNavigationBarTitleVisibility(rawValue: 1)!
        bottomNavBar.alignment = MDCBottomNavigationBarAlignment(rawValue: 1)!
        let timerItem = UITabBarItem(
            title: "タイマー",
            image: UIImage(),
            tag: 0)
        let recordItem = UITabBarItem(
            title: "記録",
            image: UIImage(),
            tag: 0)
        let titleItem = UITabBarItem(
            title: "称号",
            image: UIImage(),
            tag: 0)
        bottomNavBar.itemTitleFont = UIFont(name: "ヒラギノ角ゴ ProN", size: 16)!
        bottomNavBar.items = [timerItem, recordItem, titleItem]
        bottomNavBar.selectedItem = recordItem
        return bottomNavBar
    }
    
    func updateUIView(_ uiView: MDCBottomNavigationBar, context: Context) {
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
