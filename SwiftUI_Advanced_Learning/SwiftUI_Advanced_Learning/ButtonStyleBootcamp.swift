//
//  ButtonStyleBootcamp.swift
//  SwiftUI_Advanced_Learning
//
//  Created by Grazi  Berti on 24/01/24.
//

import SwiftUI

struct PressableStyle: ButtonStyle {
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            //.brightness(configuration.isPressed ? 0.3 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button {
            print("Oi")
        } label: {
            Text("Click Me")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
        }
        .withPressableStyle(scaledAmount: 0.5)
        //.buttonStyle(PressableStyle())
        .padding(40)
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
