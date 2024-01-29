//
//  CommonText.swift
//  ULeap
//
//  Created by Jaymeen on 15/12/23.
//

import SwiftUI

///`CommonText`
struct CommonText: View {
    var title: String
    var fontSize: Double = Constant.FontSize._16FontSize
    var fontStyle: FontStyle = .Regular
    var foregroundColor: Color = Color.AppBlack
    var action: (() -> ())?
    var body: some View {
        Text(title)
            .foregroundStyle(foregroundColor)
            .setFont(style: fontStyle, size: fontSize)
    }
}

#Preview {
    CommonText(title: "LOGIN") {}
}
