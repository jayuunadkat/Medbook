//
//  MedBookApp.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 25/01/24.
//

import SwiftUI

@main
struct MedBookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var userDataController: UserDataController = UserDataController()
    @State private var alert: AlertData = AlertData.empty
    @State private var showAlert: Bool = false
    @State private var showLoader: Bool = false
    @State var splashDone: Bool = false
    @StateObject var viewRouter = ViewRouter()

    var body: some Scene {
        WindowGroup {
            ZStack {
                if !splashDone {
                    SplashView()
                } else {
                    if self.viewRouter.isLoggedIn || self.viewRouter.currentView == .Home {
                        HomeView()
                    } else {
                        BaseView()
                            .opacity(splashDone ? 1 : 0)
                    }
                }
            }
            .environmentObject(self.viewRouter)

            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    withAnimation {
                        splashDone = true
                    }
                })
            }
            .alert(isPresented: $showAlert) {
                return Alert(title: Text(alert.title), message: Text(alert.message), dismissButton: alert.dismissButton)
            }
            .onReceive(NotificationCenter.default.publisher(for: .showLoader)) { result in
                if let loaderData = result.object as? [Any], let showLoader = loaderData.first as? Bool {
                    self.showLoader = showLoader
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: .showAlert)) { result in
                if let alert = result.object as? AlertData {
                    self.alert = alert
                    self.showAlert = true
                }
            }
            .activityIndicator(show: self.showLoader)
            .environment(\.managedObjectContext, userDataController.container.viewContext)
        }
    }
}
