//
//  NavigationUtil.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 29/01/24.
//

import Foundation
import UIKit

///`NavigationUtil`
struct NavigationUtil {

    ///`PopToRootView`
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.keyWindow?.rootViewController)?.popToRootViewController(animated: true)
    }

    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {

        guard let viewController = viewController else {
            return nil
        }

        if let navigationController = viewController as? UINavigationController {
            return navigationController

        }
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        return nil
    }
}

// MARK: - UIApplication Extensions
extension UIApplication {
    /// `returns keyWindows from UIWindowScenes`
    static var keyWindow: UIWindow? {
        return self.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
