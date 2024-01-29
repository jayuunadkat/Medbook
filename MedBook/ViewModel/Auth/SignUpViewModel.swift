//
//  AuthViewModel.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 27/01/24.
//

import Foundation
import SwiftUI
import CoreData

///`AuthViewModel`
class AuthViewModel: ObservableObject {
    @Published var arrPasswordValidations: [ValidationModel] = [
        ValidationModel(validationText: Constant.AppString.kAtLeast8Characters),
        ValidationModel(validationText: Constant.AppString.kMustContainAnUppercaseLetter),
        ValidationModel(validationText: Constant.AppString.kContainsASpecialCharacter)
    ]

    @Published var allUsers: [UserModel] = []

    @Published var txtEmail: TextFieldModel = TextFieldModel(
        text: "",
        placeholderText: Constant.AppString.kEmail,
        image: Constant.Image.kCheckmark,
        isValidated: false
    )
    @Published var txtPassword: TextFieldModel = TextFieldModel(
        text: "",
        placeholderText: Constant.AppString.kPassword,
        image: Constant.Image.kCheckmark,
        isValidated: false
    )
    @Published var authType: AuthType = .Login
    @Published var countryData: [CountryData] = []
    @Published var selectedCountry: CountryData = CountryData(country: "", region: "")
    @Published var isLoginEnabled: Bool = false

    init(authType: AuthType = .Login) {
        self.authType = authType
    }
}

/// `ValidationModel`
/// to validate password field
extension AuthViewModel {
    struct ValidationModel: Codable {
        var validationText: String
        var isValidated: Bool = false
    }
}

///`getCountriesData`
extension AuthViewModel {
    func getCountriesData(userMOC: NSManagedObjectContext, completion: @escaping (() -> ())) {
        if self.countryData.isEmpty {
            self.getCurrentCountry {
                CountryData.getCountries { [weak self] arrCountries in
                    Indicator.hide()
                    guard let self = self else { return }
                    self.countryData = arrCountries
                    self.selectedCountry = self.countryData.first(where: {$0.country == self.selectedCountry.country}) ?? CountryData()

                    for i in 0..<self.countryData.count {
                        let country = Country(context: userMOC)
                        country.id = UUID()
                        country.region = self.countryData[i].region
                        country.countryCode = self.countryData[i].countryCode
                        country.country = self.countryData[i].country
                        try? userMOC.save()
                    }
                }
            }
        } else {
            self.getCurrentCountry {
                self.selectedCountry = self.countryData.first(where: {$0.country == self.selectedCountry.country}) ?? CountryData()
                completion()
            }
        }
    }
}

///`getCurrentCountry`
extension AuthViewModel {
    func getCurrentCountry(completion: @escaping (() -> ())) {
        if UserDefaults.currentCountry.isEmpty {
            Indicator.show()
            CountryData.getCurrentCountry { [weak self] currentCountry in
                guard let self = self else { return }
                self.selectedCountry = CountryData(country: currentCountry, region: "")
                UserDefaults.currentCountry = currentCountry
                completion()
                Indicator.hide()
            }
        } else {
            self.selectedCountry = CountryData(country: UserDefaults.currentCountry, region: "")
            completion()
        }
    }
}


///`validateEmail`
extension AuthViewModel {
    func validateEmail() {
        withAnimation {
            self.txtEmail.isValidated = self.txtEmail.text.isValidEmail()
            isLoginEnabled = txtPassword.isValidated && txtEmail.isValidated
        }
    }

    ///`ValidatePassword`
    func validatePassword() {
        withAnimation {
            self.arrPasswordValidations[1].isValidated = self.txtPassword.text.filter({$0.isUppercase}).count > 0
            self.arrPasswordValidations[2].isValidated = self.txtPassword.text.hasSpecialCharacter()
            self.arrPasswordValidations[0].isValidated = self.txtPassword.text.count >= 8
            
            self.txtPassword.isValidated = arrPasswordValidations[1].isValidated &&
            arrPasswordValidations[2].isValidated &&
            arrPasswordValidations[0].isValidated
            isLoginEnabled = txtPassword.isValidated && txtEmail.isValidated
        }
    }
}

///`AuthType`
extension AuthViewModel {
    enum AuthType: Int {
    case Login = 0
    case SignUp = 1
    }
}

///`SaveUser`
extension AuthViewModel {
    func saveUser(userMOC: NSManagedObjectContext, completion: @escaping (() -> ())) {
        if allUsers.first(where: {$0.email.trimWhiteSpace.lowercased() == self.txtEmail.text.trimWhiteSpace.lowercased()}) == nil {
            let user = User(context: userMOC)
            user.id = UUID()
            user.email = self.txtEmail.text.trimWhiteSpace
            user.password = self.txtPassword.text
            do {
                try userMOC.save()
                self.allUsers.append(
                    UserModel(
                        id: user.id ?? UUID(),
                        email: user.email ?? "",
                        password: user.password ?? ""
                    )
                )
                UserDefaults.isLoggedIn = true
                UserDefaults.userEmail = txtEmail.text
                completion()
            } catch let error {
                print("Error >>> \(error.localizedDescription)")
            }
        } else {
            Alert.show(message: "User already exists")
        }
    }
}

///`UserModel`
extension AuthViewModel {
    struct UserModel: Codable {
        let id: UUID
        let email: String
        let password: String
    }
}

///`btnActionTapped`
extension AuthViewModel {
    func btnActionTapped(userMOC: NSManagedObjectContext, completion: @escaping (() -> ())) {
        switch authType {
        case .Login:
            loginUser(userMOC: userMOC, completion: completion)
        case .SignUp:
            saveUser(userMOC: userMOC, completion: completion)
        }
    }

    ///`loginUser`
    func loginUser(userMOC: NSManagedObjectContext, completion: @escaping (() -> ())) {
        if allUsers.first(where: {
            $0.email.trimWhiteSpace.lowercased() == self.txtEmail.text.trimWhiteSpace.lowercased() &&
            $0.password.trimWhiteSpace.lowercased() == self.txtPassword.text.trimWhiteSpace.lowercased()
        }) != nil {
            UserDefaults.isLoggedIn = true
            UserDefaults.userEmail = txtEmail.text
            completion()
        } else {
            Alert.show(message: "Incorrect username or password.")
        }
    }
}
