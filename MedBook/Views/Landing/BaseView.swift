//
//  BaseView.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 25/01/24.
//

import SwiftUI

///`BaseView`
struct BaseView: View {
    @State var shouldMove: Bool = false
    @State var selectedView: SelectedView = .Login
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundColor()
                VStack(alignment: .leading, spacing: 0) {
                    HeaderView()
                    ImageSectionView()
                    Spacer()
                    BottomButtons()
                }
                .navigationDestination(isPresented: $shouldMove) {
                    getDestinationView()
                }
            }
        }
    }
}

///`HeaderView`
extension BaseView {
    func HeaderView() -> some View {
        CommonText(
            title: Constant.AppString.kMedBook,
            fontSize: Constant.FontSize._28FontSize,
            fontStyle: .Bold,
            foregroundColor: .AppGrayColor
        )
        .padding(.horizontal, Constant.setSpace._16Padding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, Constant.setSpace._48Padding)
        .background(Color.AppBackgroundDarkGray)
    }

    ///`AppBackgroundColor`
    func AppBackgroundColor() -> some View {
        Color.AppBackgroundColor
            .ignoresSafeArea()
    }
}

///`ImageSection`
extension BaseView {
    func ImageSectionView() -> some View {
        Image(Constant.Image.kAppLogo)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

///`BottomButtonsView`
extension BaseView {
    func BottomButtons() -> some View {
        HStack {
            BottomButtonCell(title: "SignUp") {
                selectedView = .SignUp
                shouldMove.toggle()
            }
            BottomButtonCell(title: "Login") {
                selectedView = .Login
                shouldMove.toggle()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

///`BottomButtonCell`
extension BaseView {
    func BottomButtonCell(title: String, completion: @escaping (() -> ())) -> some View {
        CommonButton(
            title: title,
            fontStyle: .SemiBold,
            backgroundColor: Color.AppWhite,
            enabled: .constant(true)
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
    }
}

#Preview {
    BaseView()
}

///`getDestinationView`
extension BaseView {
    func getDestinationView() -> some View {
        switch selectedView {
        case .Login:
            return AuthView(authVM: AuthViewModel(authType: .Login))
        case .SignUp:
            return AuthView(authVM: AuthViewModel(authType: .SignUp))
        }
    }

    enum SelectedView {
        case Login
        case SignUp
    }
}
