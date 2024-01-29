//
//  Extensions+View.swift
//  ULeap
//
//  Created by Jaymeen on 15/12/23.
//

import Foundation
import SwiftUI

///`markUnderline` Modifier
extension View {
    func markUnderline(color: Color, offset: Double = -2.0, height: Double = 1.0) -> some View {
        self
        .overlay(
            Rectangle()
                .fill(color)
                .frame(height: height)
                .offset(y: offset)
            , alignment: .bottom
        )
    }
    ///`ShowKeyboard`
    func showKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
    }

}

