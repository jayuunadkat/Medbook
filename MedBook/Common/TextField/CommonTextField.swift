//
//  CommonTextField.swift
//  ULeap
//
//  Created by differenz199 on 15/12/23.
//

import SwiftUI

///`CommonTextField`
struct CommonTextField: View {
    
    @Binding var textFieldModel: TextFieldModel
    var isEditable: Bool = true

    var body: some View {
        VStack {
            HStack(spacing: Constant.setSpace._12Padding) {
                TextField("", text: $textFieldModel.text)
                    .textInputAutocapitalization(.never)
                    .setFont(style: .Medium)
                    .AddPlaceholder(when: textFieldModel.text.isEmpty) {
                        Text(textFieldModel.placeholderText)
                            .setFont(style: .Medium)
                            .foregroundColor(Color.AppGrayTextColor)
                    }
                Image(textFieldModel.image)
                    .scaleEffect(0.8)
                    .opacity(textFieldModel.isValidated ? 1 : 0)
            }
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
                    .disabled(!isEditable)
                    .autocorrectionDisabled()
        }
        .padding(.leading, Constant.setSpace._2Padding)
    }
}



#Preview {
    CommonTextFieldView()
}

struct CommonTextFieldView: View {
    @State var txtField: String = ""
    var body: some View {
        CommonTextField(textFieldModel: .constant(TextFieldModel()))
    }
}

///`AddPlaceholder`
extension View {
    func AddPlaceholder<Content: View>(
        alignment: Alignment = .leading,
        when shouldShow: Bool,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder()
                    .opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

///`TextFieldModel`
struct TextFieldModel: Codable {
    var text: String
    var placeholderText: String
    var image: String
    var isValidated: Bool


    init(
        text: String = "",
        placeholderText: String = "",
        image: String = "",
        isValidated: Bool = false
    ) {
        self.text = text
        self.placeholderText = placeholderText
        self.image = image
        self.isValidated = isValidated
    }
}
