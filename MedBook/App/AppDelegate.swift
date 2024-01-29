//
//  AppDelegate.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 29/01/24.
//

import Foundation
import UIKit
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
