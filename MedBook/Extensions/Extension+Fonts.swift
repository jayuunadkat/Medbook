//
//  Extension+Fonts.swift
//  ULeap
//
//  Created by Jaymeen on 14/12/23.
//

import Foundation
import UIKit
import SwiftUI

///`UIFont`
extension UIFont {
    static let alertTitle = UIFont(name: "HelveticaNeue-Medium", size: 17)
    static let alertMessage = UIFont(name: "HelveticaNeue", size: 13)
    static let alertTitleiPad = UIFont(name: "HelveticaNeue-Medium", size: 22)
    static let alertMessageiPad = UIFont(name: "HelveticaNeue", size: 18)
    static let regularTitle = UIFont(name: "HelveticaNeue", size: 17)
    static let regularTitleiPad = UIFont(name: "HelveticaNeue", size: 22)
    static let navigationBarTitle = UIFont(name: "HelveticaNeue-Light", size: 21)
    static let navigationBarTitleiPad = UIFont(name: "HelveticaNeue-Light", size: 26)
}

///`FontStyle`
enum FontStyle: String {
    case Black                            =  "Jost-Black"
    case BlackItalic                      =  "Jost-BlackItalic"
    case Bold                             =  "Jost-Bold"
    case BoldItalic                       =  "Jost-BoldItalic"
    case ExtraBold                        =  "Jost-ExtraBold"
    case ExtraBoldItalic                  =  "Jost-ExtraBoldItalic"
    case ExtraLight                       =  "Jost-ExtraLight"
    case ExtraLightItalic                 =  "Jost-ExtraLightItalic"
    case Italic                           =  "Jost-Italic"
    case Light                            =  "Jost-Light"
    case LightItalic                      =  "Jost-LightItalic"
    case Medium                           =  "Jost-Medium"
    case MediumItalic                     =  "Jost-MediumItalic"
    case Regular                          =  "Jost-Regular"
    case SemiBold                         =  "Jost-SemiBold"
    case SemiBoldItalic                   =  "Jost-SemiBoldItalic"
    case Thin                             =  "Jost-Thin"
    case ThinItalic                       =  "Jost-ThinItalic"
}

///`SetFont`
extension Font {
    static func setFont(style: FontStyle = .Regular, size: CGFloat = Constant.FontSize._16FontSize) -> Font {
        return .custom(style.rawValue, size: size)
    }
}

///`SetFont Function`
extension View {
    func setFont(style: FontStyle = .Regular, size: CGFloat = Constant.FontSize._16FontSize) -> some View {
        self
        .font(.setFont(style: style, size: size))
    }
}

