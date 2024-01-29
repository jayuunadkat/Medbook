//
//  Extensions+Data.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 27/01/24.
//

import Foundation

extension Data {
    /// `prints the json to pretty format`
    var prettyPrintedJSONString: String? {
        /// `NSString gives us a nice sanitized debugDescription`
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: .utf8) else { return nil }

        return prettyPrintedString
    }
}
