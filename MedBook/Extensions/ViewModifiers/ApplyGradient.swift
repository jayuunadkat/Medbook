//
//  ApplyGradient.swift
//  ULeap
//
//  Created by Jaymeen on 14/12/23.
//

import Foundation
import SwiftUI

///`ApplyGradient` ViewModifier
struct ApplyGradient: ViewModifier {
    
    var start: UnitPoint
    var end: UnitPoint
    var startColor: Color
    var middleColor: Color?
    var endColor: Color
    var colors: [Color] {
        return middleColor == nil ? [startColor, endColor] : [startColor, middleColor!, endColor]
    }
    
    func body(content: Content) -> some View {
        content
            .background {
                LinearGradient(colors: colors, startPoint: start, endPoint: end)
            }
    }
}


extension View {
    func applyGradient(
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .bottom,
        startColor: Color = .AppPurple,
        middleColor: Color? = .AppDarkPink,
        endColor: Color = Color.AppPink
    ) -> some View {
        modifier(ApplyGradient(start: startPoint, end: endPoint, startColor: startColor, middleColor: middleColor, endColor: endColor))
    }
}

