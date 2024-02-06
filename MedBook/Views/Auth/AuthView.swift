//
//  AuthView.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 27/01/24.
//

import SwiftUI

///`AuthView`
struct AuthView: View {
    @Environment(\.managedObjectContext) var userMOC
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @FetchRequest(sortDescriptors: []) var countryData: FetchedResults<Country>
    @EnvironmentObject var viewRouter: ViewRouter
    
    @StateObject var authVM: AuthViewModel =  AuthViewModel(authType: .Login)
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            AppBackgroundColor()
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HeaderView()
                    TextFieldView()
                    if authVM.authType == .SignUp {
                        ValidationCheckBoxView()
                        if !viewRouter.isLoggedIn {
                            CountrySelectionView()
                        }
                    }
                    Spacer()
                    ButtonCell(
                        title: authVM.authType == .SignUp ? Constant.AppString.kLetsGo : Constant.AppString.kLogin,
                        isActive: $authVM.isLoginEnabled
                    ) {
                        if authVM.isLoginEnabled {
                            authVM.btnActionTapped(userMOC: userMOC) {
                                viewRouter.isLoggedIn = true
                            }
                        }
                    }
                }
                .frame(minHeight: ScreenSize.SCREEN_HEIGHT - 110)
                .onAppear {
                    self.authVM.allUsers = self.users.map { element in
                        AuthViewModel.UserModel(
                            id: element.id ?? UUID(),
                            email: element.email ?? "",
                            password: element.password ?? ""
                        )
                    }
                    if self.authVM.authType == .SignUp {
                        
                        authVM.countryData = self.countryData.map({
                            element in
                            CountryData(
                                country: element.country ?? "",
                                region: element.region ?? "",
                                countryCode: element.countryCode ?? ""
                            )
                        })
                        
                        authVM.getCountriesData(userMOC: userMOC) {}
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CommonBackButton {
                    
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onChange(of: self.authVM.txtEmail.text) { _,_ in
            self.authVM.validateEmail()
        }
        .onChange(of: self.authVM.txtPassword.text) { _,_ in
            self.authVM.validatePassword()
        }
        .onAppear {
            self.scrollBounces(false)
        }
    }
}



#Preview {
    AuthView()
}

extension AuthView {
    ///`AppBackgroundColor`
    func AppBackgroundColor() -> some View {
        Color.AppBackgroundColor
            .ignoresSafeArea()
    }
}

///`HeaderView`
extension AuthView {
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: Constant.setSpace._2Padding) {
            CommonText(
                title: "\(Constant.AppString.kWelcome)\(authVM.authType == .Login ? "," : "")",
                fontSize: Constant.FontSize._28FontSize,
                fontStyle: .Bold,
                foregroundColor: .AppGrayColor
            )
            CommonText(
                title: authVM.authType == .SignUp ? Constant.AppString.kSignUpToContinue : Constant.AppString.kLoginToContinue,
                fontSize: Constant.FontSize._28FontSize,
                fontStyle: .Bold,
                foregroundColor: .AppGrayTextColor
            )
        }
        .padding(.horizontal, Constant.setSpace._16Padding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, Constant.setSpace._25Padding)
    }
}


///`SignUpTextFields    `
extension AuthView {
    func TextFieldView() -> some View {
        VStack(spacing: Constant.setSpace._48Padding) {
            CommonTextField(
                textFieldModel: self.$authVM.txtEmail
            )
            CommonSecureField(
                nameOfField: self.$authVM.txtPassword.text,
                placeholderText: self.authVM.txtPassword.placeholderText,
                image: ""
            )
        }
        .padding(.top, Constant.setSpace._48Padding)
        .padding(.horizontal, Constant.setSpace._12Padding)
    }
}

extension AuthView {
    ///`validationCheckBoxView`
    func ValidationCheckBoxView() -> some View {
        VStack(alignment: .leading, spacing: Constant.setSpace._14Padding) {
            ForEach(0..<self.authVM.arrPasswordValidations.count, id: \.self) { i in
                CheckBoxCell(checkBoxCell: $authVM.arrPasswordValidations[i])
            }
        }
        .padding(.horizontal, Constant.setSpace._18Padding)
        .padding(.top, Constant.setSpace._30Padding * 1.3)
        
    }
    
    ///`CheckBoxCellView`
    func CheckBoxCell(checkBoxCell: Binding<AuthViewModel.ValidationModel>) -> some View {
        HStack(spacing: Constant.setSpace._20Padding) {
            Button {
                checkBoxCell.isValidated.wrappedValue.toggle()
            } label: {
                Image(
                    checkBoxCell.wrappedValue.isValidated ?
                    Constant.Image.kCheckboxSelected :
                        Constant.Image.kCheckboxUnSelected
                )
                .resizable()
                .frame(
                    width: Constant.setFrame._30Size,
                    height: Constant.setFrame._30Size
                )
                .scaleEffect(checkBoxCell.wrappedValue.isValidated ? 0.7 : 1)
            }
            CommonText(
                title: checkBoxCell.validationText.wrappedValue,
                fontSize: Constant.FontSize._18FontSize,
                fontStyle: .SemiBold
            )
        }
    }
}

///`CountrySelectionView`
extension AuthView {
    func CountrySelectionView() -> some View {
        VStack(spacing: Constant.setSpace._14Padding) {
            Picker("Programming language", selection: $authVM.selectedCountry) {
                ForEach(self.authVM.countryData, id: \.self) { i in
                    Text(i.country)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 140)
        }
        .padding(.top, Constant.setSpace._20Padding)
    }
}

///`CountrySelectionView`
extension AuthView {
    func ButtonCell(title: String, isActive: Binding<Bool>, completion: @escaping (() -> ())) -> some View {
        CommonButton(
            title: title,
            fontStyle: .SemiBold,
            backgroundColor: Color.AppWhite,
            image: "arrow.right",
            enabled: isActive
        ) {
            completion()
        }
        .frame(width: ScreenSize.SCREEN_WIDTH / 2 - Constant.setSpace._48Padding)
        .background(Color.AppWhite)
        .applyBorder(
            borderColor: Color.AppBlack,
            cornerRadius: Constant.setSpace._12Padding,
            width: 1
        )
        .frame(maxWidth: .infinity)
        .padding(.bottom, Constant.setSpace._14Padding)
    }
}
