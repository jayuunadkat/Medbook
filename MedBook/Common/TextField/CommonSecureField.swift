//
//  CommonSecureField.swift
//  ULeap
//
//  Created by differenz199 on 15/12/23.
//

import SwiftUI

struct CommonSecureField: View {
    
    @Binding var nameOfField: String
    var placeholderText: String
    var image: String
    @State var isSecured: Bool = true
    @State var showPassword: Bool = false
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: Constant.setSpace._12Padding) {
                Group {
                    HStack {
                        ZStack(alignment: .trailing) {
                            TextField("", text: $nameOfField)
                                .textContentType(.password)
                                .focused($focus1)
                                .opacity(showPassword ? 1 : 0)
                            SecureField("", text: $nameOfField)
                                .textContentType(.password)
                                .focused($focus2)
                                .opacity(showPassword ? 0 : 1)
                        }
                        Button(action: {
                            showPassword.toggle()
                        }, label: {
                            Image(self.showPassword ? Constant.Image.kEyeOpen : Constant.Image.kEyeClose)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(width: Constant.setFrame._21Size,height: Constant.setSpace._16Padding)
                        })
                    }
                }
                .autocorrectionDisabled()

                    .AddPlaceholder(when: nameOfField.isEmpty) {
                        Text(placeholderText)
                            .foregroundColor(Color.AppGrayTextColor)
                            .setFont()
                    }
                    .setFont()
                    .frame(height: Constant.setFrame._49Size)
                    .cornerRadius(Constant.setSpace._10Padding)
                    .padding(.horizontal,Constant.setSpace._12Padding)
                    .overlay(alignment: .bottom, content: {
                        Text("")
                            .frame(height: 2)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.AppGrayTextColor.opacity(0.7))
                            .padding(.leading, Constant.setSpace._10Padding)
                    })



            }
        }
        .padding(.leading, Constant.setSpace._2Padding)
    }
}

#Preview {
    CommonSecureField(nameOfField: .constant(""), placeholderText: "", image: Constant.Image.kLoginEmail)
        .padding(10)
}
