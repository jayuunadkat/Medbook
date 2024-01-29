//
//  ViewModifiers+ViewExtensions.swift
//  ULeap
//
//  Created by Jaymeen on 19/12/23.
//

import Foundation
import SwiftUI

extension View {
    /// `ScrollBounces`
    /// Used for starting or stoping the scrollview bounces
    func scrollBounces(_ shouldStart: Bool) {
        UIScrollView.appearance().bounces = shouldStart
    }
}


///`Conditional View Modifier`
extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> TupleView<(Self?, Content?)> {
        if conditional {
            return TupleView((nil, content(self)))
        } else {
            return TupleView((self, nil))
        }
    }
}

/// `custom swipe actions (with only single button)`
extension View {
    func swipeActions(color: Color = .clear, iconLast: String = "BookMark", action: @escaping (_ event: SwipeActionsModifier.EventType) -> Void) -> some View {
        return self.modifier(SwipeActionsModifier(color: color, iconLast: iconLast, action: action))
    }
}
