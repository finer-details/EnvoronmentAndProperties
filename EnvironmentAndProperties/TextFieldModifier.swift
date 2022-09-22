//
//  TextFieldModifier.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 16/09/2022.
//

import SwiftUI


struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 200, height: 44, alignment: .center)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1.5))
            .padding(.bottom, 20)
    }
}
