//
//  MaterialButton.swift
//  SlokinTimer
//
//  Created by 松本真太朗 on 2021/06/27.
//

import SwiftUI
import MaterialComponents.MaterialButtons

struct MaterialButton: UIViewRepresentable {
    let label: String
    let action: () -> Void
    
    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    
    func makeUIView(context: Context) -> MDCButton {
        let button = MDCButton()
        button.minimumSize = CGSize(width: 64, height: 48)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: MDCButton, context: Context) {
        uiView.setTitle(label, for: .normal)
        uiView.setTitleFont(UIFont(name: "ヒラギノ角ゴ ProN", size: 16)!, for: .normal)
        uiView.setTitleColor(UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 1), for: .normal)
        uiView.setBackgroundColor(UIColor.init(red: 238/255, green: 238/255, blue: 238/255, alpha: 1))
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var button: MaterialButton
        
        init (_ button: MaterialButton) {
            self.button = button
        }
        
        @objc func buttonTapped() {
            button.action()
        }
    }
}

struct MaterialButton_Previews: PreviewProvider {
    static var previews: some View {
        MaterialButton("サンプル") {
            print("hello")
        }
    }
}
