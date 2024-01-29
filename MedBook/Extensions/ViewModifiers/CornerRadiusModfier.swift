//
//  CornerRadiusModfier.swift
//  ULeap
//
//  Created by Jaymeen on 22/12/23.
//

import Foundation
import SwiftUI

///`RoundedCorners`
struct RoundedCorner: Shape
{
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path
    {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
        
    }
    
}

///`CornerRadius`
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View { 
        clipShape( 
            RoundedCorner(
                radius: radius,
                corners: corners
            )
        )
    }
}

///`BorderRadius`
extension View {
    public func borderRadius<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat, corners: UIRectCorner) -> some View where S : ShapeStyle {
        let roundedRect = RoundedCorner(radius: cornerRadius, corners: corners)
        return clipShape(roundedRect)
            .overlay(roundedRect.stroke(content, lineWidth: width))
    }
}
