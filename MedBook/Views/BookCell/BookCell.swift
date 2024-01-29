//
//  BookCell.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 28/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

///`BookCell`
struct BookCell: View {
    var bookData: BookData
    @State var showAnimation: Bool = false
    var index: Int
    var body: some View {
        VStack {
            HStack(spacing: Constant.setSpace._18Padding) {
                WebImage(url: URL(string: bookData.fullImageURL))
                    .resizable()
                    .placeholder(Image(Constant.Image.kBook))
                    .indicator(.activity)
                    .frame(
                        width: Constant.setFrame._49Size,
                        height: Constant.setFrame._49Size,
                        alignment: .center
                    )
                    .cornerRadius(Constant.setSpace._8Padding)
                    .padding(.all, Constant.setSpace._4Padding)
                    .applyBorder(cornerRadius: Constant.setSpace._4Padding)


                VStack(alignment: .leading, spacing: 0) {
                    TitleView()
                    DescriptionView()
                }
            }
            .padding(.all, Constant.setSpace._10Padding)
            .background(Color.AppBackgroundGray)
            .applyBorder(cornerRadius: Constant.setSpace._12Padding)
            .opacity(showAnimation ? 1 : 0)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.3).delay(Double(index) * 0.05)) {
                    showAnimation = true
                }
            }
        }
    }
}

///`TitleView`
extension BookCell {
    func TitleView() -> some View {
        CommonText(
            title: bookData.title ?? "",
            fontSize: Constant.FontSize._18FontSize,
            fontStyle: .Medium
        )
        .lineLimit(1)
    }
}

///`DescriptionView`
extension BookCell {
    func DescriptionView() -> some View {
        HStack {
            CommonText(
                title: bookData.authorName?.first ?? "",
                fontSize: Constant.FontSize._18FontSize,
                fontStyle: .Regular,
                foregroundColor: .AppPlaceHolderColor
            )
            .lineLimit(1)
            Spacer()

            HStack(spacing: Constant.setSpace._12Padding){
                RatingsCell(
                    ratingCount: "\(String(format: "%.1f", bookData.ratingsAverage ?? 0))",
                    image: Constant.Image.kStar
                )
                RatingsCell(
                    ratingCount: "\(bookData.ratingsCount ?? 0)",
                    image: Constant.Image.kSigma
                )
            }
            .fixedSize()
            .padding(.trailing, Constant.setSpace._6Padding)
        }
    }
}

extension BookCell {
    func RatingsCell(ratingCount: String, image: String) -> some View {
        HStack {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18, alignment: .center)
                .foregroundColor(.yellow)
            CommonText(title: ratingCount)
                .lineLimit(1)

        }
    }
}

#Preview {
    BookCell(
        bookData:
            BookData(
                title: "A GAME OF YOU",
                authorName: ["Neil Gaiman Neil Gaiman Neil Gaiman"],
                coverImage: 5807570,
                ratingsCount: 433333,
                ratingsAverage: 4.0833335
            
        ),
        index: 1
    )
}


