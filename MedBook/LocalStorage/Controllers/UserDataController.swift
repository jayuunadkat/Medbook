//
//  UserDataController.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 29/01/24.
//

import Foundation
import CoreData


///`UserDataController`
/// holds all user data
class UserDataController: ObservableObject {
    let container = NSPersistentContainer(name: "UserModel")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error >> \(error.localizedDescription)")
            }
        }
    }
}
