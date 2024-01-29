//
//  BookMarkView.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 29/01/24.
//

import SwiftUI

///`BookMarkView`
struct BookMarkView: View {
    @Environment(\.managedObjectContext) var userMOC
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", "\(UserDefaults.userEmail)")) var userBookMarked: FetchedResults<UserBooks>
    @Environment(\.presentationMode) private var dismiss

    @StateObject var bookMarkVM: BookMarkViewModel = BookMarkViewModel()

    var body: some View {
        ZStack {
            AppBackgroundColor()
            VStack {
                if !bookMarkVM.bookMarks.isEmpty {
                    ScrollView {
                        BooksView()
                    }
                } else {
                    CommonText(
                        title: "No Bookmarks found.",
                        fontSize: Constant.FontSize._18FontSize,
                        fontStyle: .SemiBold,
                        foregroundColor: .AppPlaceHolderColor
                    )
                }
            }
            .padding(.all, Constant.setSpace._16Padding)
            .padding(.top, Constant.setSpace._16Padding)
        }
        .onAppear {
            self.bookMarkVM.bookMarks =
                self.userBookMarked.map { book in
                    BookData(
                        title: book.title ?? "",
                        authorName: [book.authorName ?? ""],
                        coverImage: UInt64(book.coverImage),
                        ratingsCount: UInt64(book.ratingsCount),
                        ratingsAverage: book.ratingsAverage
                    )
                }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                CommonBackButton {
                    dismiss.wrappedValue.dismiss()
                }
                CommonText(
                    title: Constant.AppString.kBookMarks,
                    fontSize: Constant.FontSize._30FontSize,
                    fontStyle: .Bold,
                    foregroundColor: .AppBlack) {

                    }
            }
            }
        }
        .navigationBarBackButtonHidden()

    }
}

#Preview {
    BookMarkView()
}


extension BookMarkView {
    ///`AppBackgroundColor`
    func AppBackgroundColor() -> some View {
        Color.AppBackgroundColor
            .ignoresSafeArea()
    }
}


///`BooksView`
extension BookMarkView {
    func BooksView() -> some View {
        ScrollView {
            LazyVStack(spacing: Constant.setSpace._14Padding) {
                ForEach(
                    Array(self.bookMarkVM.bookMarks.enumerated()),
                    id: \.0
                ) { i, element in
                    BookCell(
                        bookData: element,
                        index: 10
                    )
                    .applyBorder(cornerRadius: Constant.setSpace._12Padding)
                    .swipeActions(iconLast: "bookmark.fill") { event in
                        withAnimation {
                            self.bookMarkVM.bookMarks.removeAll(where: {$0.title ?? "" == element.title ?? ""})
                            if let object = self.userBookMarked.first(where: {$0.title ?? "" == element.title ?? ""}) {
                                userMOC.delete(object)
                                try? userMOC.save()
                            }
                        }
                    }

                }
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea(edges: .bottom)
    }
}
