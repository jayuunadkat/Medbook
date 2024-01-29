//
//  AlertModel.swift
//  ULeap
//
//  Created by Jaymeen on 19/12/23.
//

import Foundation
import SwiftUI

///`AlertData`
class AlertData {
    
    static var empty = AlertData(title: "Sample", message: "Empty", isLogOut: false)
    var title: String
    var message: String
    var isLogOut: Bool

    
    private(set) var dismissButton: Alert.Button = .default(Text(Constant.AppString.OK))
    
    init(title: String, message: String, isLogOut: Bool) {
        
        self.title = title
        self.message = message
        self.isLogOut = isLogOut
        
        if isLogOut {
            dismissButton = .default(Text(Constant.AppString.OK)){

            }
        }
    }
}
