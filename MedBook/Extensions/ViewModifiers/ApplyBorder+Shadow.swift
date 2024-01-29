//
//  ApplyBorder+Shadow.swift
//  ULeap
//
//  Created by Jaymeen on 21/12/23.
//

import Foundation
import SwiftUI

/// `applyBorder` to a View
extension View {
    func applyBorder(borderColor: Color = .AppBorderColor, cornerRadius: Double, width: Double = 1.0) -> some View {
        self
        .clipShape(RoundedRectangle(cornerRadius: Constant.setSpace._10Padding))
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: width)
        )
        .padding(.horizontal, 1)
    }
}

/// `Apply Shadow`
extension View {
    func applyShadow(shadowColor: Color = .AppDarkPurple.opacity(0.5), radius: Double = 2.5, x: Double = 0.0, y: Double = 0.0) -> some View {
        self
            .shadow(
                color: shadowColor,
                radius: radius,
                x: x, y: y
            )
    }
}
