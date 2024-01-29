//
//  CommonBackButton.swift
//  ULeap
//
//  Created by Jaymeen on 18/12/23.
//

import Foundation
import SwiftUI

///`CommonButton`
struct CommonBackButton: View {
    var image: String = Constant.Image.kBackArrow
    var imageWidth: Double = Constant.setFrame._28Size
    var imageHeight: Double = Constant.setFrame._28Size
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(image)
                .resizable()
                .frame(width: imageWidth,height: imageHeight)
        })
    }
}

#Preview {
    CommonBackButton(image: Constant.Image.kBackArrow) {

    }
}
