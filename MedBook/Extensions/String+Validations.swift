//
//  String+Validations.swift
//  ULeap
//
//  Created by Jaymeen on 18/12/23.
//

import Foundation
import UIKit

///`Validations`
extension String{
    //MARK: - Check Email address
    func isValidEmail() -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.trimWhiteSpace)
    }
    
    /// `ValidPhoneNumber`
    func isValidPhoneNumber() -> Bool {
        let PHONE_REGEX = "^[0-9+]{0,1}+[0-9]{8,15}$"
        let phonePred = NSPredicate(format:"SELF MATCHES %@", PHONE_REGEX)
        return phonePred.evaluate(with: self.trimWhiteSpace)

    }
    
    ///' ValidPassword`
    func isValidPassword() -> Bool {
        let PASSWORD_REGEX = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", PASSWORD_REGEX)
        return passwordPred.evaluate(with: self.trimWhiteSpace)

    }
    
    ///`URL Regex`
    func isValidUrl(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }
    

    ///`URL Regex`
    func isValidFacebookUrl(url: String) -> Bool {
        let pattern = #"^(https?:\/\/)?(www\.)?facebook\.com\/([a-zA-Z0-9_\-\.]+)\/?$"#

        // Create a regular expression object
        guard let _ = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return false
        }

        // Check if the URL matches the pattern
        let _ = NSRange(location: 0, length: url.utf16.count)
        return url.contains(".facebook.com")
//        return regex.firstMatch(in: url, options: [], range: range) != nil
    }
    
    ///`URL Regex`
    func isValidInstagramUrl(url: String) -> Bool {
        let pattern = #"^(https?:\/\/)?(www\.)?facebook\.com\/([a-zA-Z0-9_\-\.]+)\/?$"#
        
        // Create a regular expression object
        guard let _ = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return false
        }
        
        // _ if the URL matches the pattern
        let _ = NSRange(location: 0, length: url.utf16.count)
        return url.contains("https://www.instagram.com")

//        return regex.firstMatch(in: url, options: [], range: range) != nil
    }
    
    ///`URL Regex`
    func isValidURL(urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }

    
    ///`Empty or Null`
    func isEmptyOrNull(_ string: String?) -> Bool {
        let str = string?.trimWhiteSpace ?? ""
        return str.isEmpty
    }
    
    public var trimWhiteSpace: String {
        get {
            return self.trimmingCharacters(in: .whitespaces)
        }
    }
    
    var toNumber: Double {
        Double(self) ?? 0
    }
    
    //With Out emoji
    func withoutEmoji() -> String {
        String(self.filter({!($0.isEmoji)}))
    }

    func hasSpecialCharacter() -> Bool {
        self.range(of: "[ !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]+", options: .regularExpression) != nil
    }
}

///`Character`
extension Character {
    // emoji
    var isEmoji: Bool {
        guard let scalar = unicodeScalars.first else { return false }
        return scalar.properties.isEmoji && (scalar.value > 0x238C || unicodeScalars.count > 1)
    }
}

extension String {
    func placeHolder(_ placeHolder: String) -> String {
        return self.isEmpty ? placeHolder : self
    }
}
