//
//  UserDefaultExt.swift
//  ULeap
//
//  Created by Jaymeen on 14/12/23.
//

import SwiftUI


//MARK: -  Extension Alert
extension Alert {
    //Authentication expired and Common message  Alert
    static func show(title: String = "", message: String = "", isLogOut: Bool = false) {
        NotificationCenter.default.post(name: .showAlert, object: AlertData(title: title, message: message, isLogOut: isLogOut))
        
    }
    //Show PopUp Alert
    static func showPopUp(withAlert alert: AnyView, title: String = "") {
        NotificationCenter.default.post(name: .showCustomAlert, object: alert)
    }
    //Hide Alert
    static func hide() {
        NotificationCenter.default.post(name: .showCustomAlert, object: false)
    }
}



// hex code to color convert
extension Color {
    
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}


/// `UserDefaultsKey`
struct UserDefaultsKey {
    static let kIsLogin                             = "isLogin"
    static let kCurrentCountry                      = "currentCountry"
    static let kUserEmail                           = "userEmail"

}


extension UserDefaults {
    ///`Auth Login`
    class var isLoggedIn : Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKey.kIsLogin)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.kIsLogin)
        }
    }
    ///`County`
    class var currentCountry : String {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKey.kCurrentCountry) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.kCurrentCountry)
        }
    }

    ///`County`
    class var userEmail : String {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKey.kUserEmail) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.kUserEmail)
        }
    }

}
