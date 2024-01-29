//
//  CommonSearchField.swift
//  ULeap
//
//  Created by differenz210 on 02/01/24.
//

import SwiftUI

///`CommonSearchField`
struct CommonSearchField: View {
    @Binding var txtSearch: String
    var image: String = Constant.Image.kSearchbarIcon
    var placeHolderText: String = "Search for books"
    var height: Double = Constant.setFrame._49Size
    var body: some View {
        HStack(spacing: 0) {
            Button {

            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(
                        width: Constant.setFrame._24Size,
                        height: Constant.setFrame._24Size,
                        alignment: .center
                    )
                    .foregroundColor(.AppBlack)
                    .padding(.trailing, Constant.setSpace._8Padding)
            }
            .padding(.leading, Constant.setSpace._14Padding)

            TextField("", text: $txtSearch)
                .AddPlaceholder(when: txtSearch.isEmpty) {
                    CommonText(
                        title: placeHolderText,
                        foregroundColor: .gray
                    )
                    .opacity(txtSearch.isEmpty ? 1 : 0)
                }

                .setFont()
                .frame(height: height)
                .padding(.horizontal, Constant.setSpace._16Padding)
                .autocorrectionDisabled()
            if !txtSearch.isEmpty {
                Button {
                    withAnimation {
                        txtSearch = ""
                    }
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(
                            width: Constant.setFrame._14Size,
                            height: Constant.setFrame._14Size,
                            alignment: .center
                        )
                        .foregroundColor(.gray)
                        .padding(.trailing, Constant.setSpace._25Padding)
                }
            }
        }
        .background(Color.AppBackgroundDarkGray.opacity(0.7))
        .applyBorder(borderColor: .AppBackgroundDarkGray, cornerRadius: Constant.setFrame._10Size)

    }
}

#Preview {
    CommonSearchField(txtSearch: .constant(""))
}
