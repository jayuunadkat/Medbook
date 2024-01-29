//
//  CommonButton.swift
//  ULeap
//
//  Created by Jaymeen on 14/12/23.
//

import SwiftUI

///`CommonButton`
struct CommonButton: View {
    var title: String
    var fontSize: Double = Constant.FontSize._18FontSize
    var fontStyle: FontStyle = .Medium
    var foregroundColor: Color = Color.AppBlack
    var cornerRadius: Double = Constant.setSpace._16Padding
    var height: Double = Constant.setFrame._55Size
    var horizontalPadding: Double = Constant.setSpace._16Padding
    var backgroundColor: Color? = Color.AppWhite
    var borderColor: Color? = nil
    var borderWidth: Double = 1.0
    var image: String = ""
    var enabled: Binding<Bool>
    var action: (() -> ())
    var body: some View {
        
        Button(action: {
            if enabled.wrappedValue {
                action()
            }
        },
               label: {
            
            VStack {
                HStack {
                    Text(title)
                        .foregroundStyle(enabled.wrappedValue ? foregroundColor : Color.AppTextColor)
                        .setFont(style: fontStyle, size: fontSize)

                    if !image.isEmpty {
                        Image(systemName: image)
                            .foregroundColor(enabled.wrappedValue ? .AppBlack : Color.AppTextColor)
                    }
                }

            }
            .frame(height: height)
            .padding(.horizontal, horizontalPadding)
        })
    }
}

#Preview {
    CommonButton(title: "Login", enabled: .constant(false)) {

    }
}
