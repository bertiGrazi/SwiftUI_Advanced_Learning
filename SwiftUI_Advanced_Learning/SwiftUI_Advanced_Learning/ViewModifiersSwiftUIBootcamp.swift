//
//  ViewModifiersSwiftUIBootcamp.swift
//  SwiftUI_Advanced_Learning
//
//  Created by Grazi  Berti on 24/01/24.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifiersSwiftUIBootcamp: View {
    var body: some View {
        VStack {
            Text("Login")
                .font(.subheadline)
                .withDefaultButtonFormatting(backgroundColor: .orange)
            
            Text("Cadastrar")
                .font(.subheadline)
                .withDefaultButtonFormatting(backgroundColor: .gray)
        }
    
    }
}

struct ViewModifiersSwiftUIBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifiersSwiftUIBootcamp()
    }
}
