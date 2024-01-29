//
//  SplashView.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 29/01/24.
//

import SwiftUI

///`SplashView`
struct SplashView: View {
    var body: some View {
        ZStack {
            AppBackgroundColor()
            VStack(spacing: 0) {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.AppBackgroundDarkGray)
                ImageSectionView()

                Text("")
                    .frame(maxHeight: .infinity)
                    .background(Color.AppBackgroundDarkGray)

            }
        }
    }
}

#Preview {
    SplashView()
}

///`ImageSection`
extension SplashView {
    func ImageSectionView() -> some View {
        Image(Constant.Image.kAppLogo)
            .resizable()
            .frame(width: ScreenSize.SCREEN_WIDTH)
            .aspectRatio(1, contentMode: .fill)
//            .aspectRatio(contentMode: .fit)
    }
}
///`AppBackgroundColor`
extension SplashView {
    func AppBackgroundColor() -> some View {
        Color.AppBackgroundColor
            .ignoresSafeArea()
    }
}
