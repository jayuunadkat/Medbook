//
//  ViewRouter.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 29/01/24.
//

import Foundation

///`ViewRouter`
class ViewRouter: ObservableObject {
    @Published var currentView: AppView = UserDefaults.standard.bool(forKey: UserDefaultsKey.kIsLogin) ? .Home : .Login
    @Published var isLoggedIn: Bool = false


    @Published var tabSelecteionIndex: Int = 0

    /// `SideMenu` configurations
    @Published var isSideBarOpened: Bool = false
    @Published var backOpacity: Double = 0.5

}

///`AppView`
enum AppView {
    case Login, Home
}
