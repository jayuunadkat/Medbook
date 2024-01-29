//
//  HomeView.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 28/01/24.
//

import SwiftUI

///`HomeView`
struct HomeView: View {
    @Environment(\.managedObjectContext) var userMOC
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", "\(UserDefaults.userEmail)")) var userBookMarked: FetchedResults<UserBooks>


    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    @EnvironmentObject var viewRouter: ViewRouter

    @State var moveToBookMarks: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundColor()
                VStack(alignment: .leading) {
                    HeaderView()
                    CommonSearchField(txtSearch: $homeVM.txtSearch)
                    SortByView()
                    BooksView()
                        .padding(.top, Constant.setSpace._16Padding)
                }
                .padding(.all, Constant.setSpace._16Padding)
                .padding(.top, Constant.setSpace._16Padding)
            }
            .navigationDestination(isPresented: $moveToBookMarks, destination: {
                BookMarkView()
            })
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolBarView()
            }
            .onAppear {
                self.homeVM.savedBooks = self.userBookMarked.map({
                    bookMark in
                    BookData(
                        title: bookMark.title ?? "",
                        authorName: [bookMark.authorName ?? ""],
                        coverImage: UInt64(bookMark.coverImage),
                        ratingsCount: UInt64(bookMark.ratingsCount),
                        ratingsAverage: bookMark.ratingsAverage
                    )
                })
            }
            .onChange(of: self.homeVM.txtDebouncedSearch) { _,_ in
                self.homeVM.savedBooks = homeVM.savedBooks
                self.homeVM.getBooks()
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

///`HeaderView`
extension HomeView {
    func HeaderView() -> some View {
        CommonText(
            title: Constant.AppString.kWhichTopics,
            fontSize: Constant.FontSize._28FontSize,
            fontStyle: .SemiBold
        )
    }
}

///`ToolBarContent`
extension HomeView {
    @ToolbarContentBuilder
    func ToolBarView() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack(spacing: Constant.setSpace._18Padding) {
                Button(action: {

                }, label: {
                    Image(systemName: Constant.Image.kBookFill)
                        .resizable()
                        .foregroundColor(Color.AppBlack)
                        .frame(
                            width: Constant.setFrame._40Size,
                            height: Constant.setFrame._28Size,
                            alignment: .center
                        )
                })

                CommonText(
                    title: Constant.AppString.kMedBook,
                    fontSize: Constant.FontSize._34FontSize,
                    fontStyle: .Bold
                )
                .minimumScaleFactor(0.5)
            }
        }

        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: Constant.setSpace._14Padding * 1.5) {
                Button {
                    moveToBookMarks = true
                } label: {
                    Image(systemName: Constant.Image.kbookMarkFill)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.AppBlack)
                        .frame(
                            width: Constant.setFrame._18Size,
                            height: Constant.setFrame._28Size,
                            alignment: .center
                        )
                }
                Button {
                    viewRouter.isLoggedIn = false
                    viewRouter.currentView = .Login
                    UserDefaults.userEmail = ""
                    UserDefaults.isLoggedIn = false
                    NavigationUtil.popToRootView()
                } label: {
                    Image(systemName: Constant.Image.kXMarkCircle)
                        .resizable()
                        .foregroundColor(Color.red)
                        .frame(
                            width: Constant.setFrame._24Size,
                            height: Constant.setFrame._24Size,
                            alignment: .center
                        )
                }
            }
        }
    }
}

#Preview {
    HomeView()
}


extension HomeView {
    ///`AppBackgroundColor`
    func AppBackgroundColor() -> some View {
        Color.AppBackgroundColor
            .ignoresSafeArea()
    }
}

///`BooksView`
extension HomeView {
    func BooksView() -> some View {
        ScrollView {
            LazyVStack(spacing: Constant.setSpace._14Padding) {
                ForEach(
                    Array(getSortedData().enumerated()),
                    id: \.0
                ) { i, element in
                    BookCell(
                        bookData: element,
                        index: 10
                    )
                    .applyBorder(cornerRadius: Constant.setSpace._12Padding)
                    .swipeActions(iconLast: self.homeVM.savedBookTitles.contains(element.title ?? "") ? "bookmark.fill" : "bookmark") { event in
                        if self.homeVM.savedBookTitles.contains(element.title ?? "") {
                            homeVM.deleteBook(by: element.title ?? "", userMOC: userMOC, bookMarks: userBookMarked)
                        } else {
                            homeVM.saveBook(by: element.title ?? "", userMOC: userMOC)
                        }
                    }
                    .onAppear {
                        homeVM.paginateBooks(index: i)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea(edges: .bottom)
    }
}

///`SortByView`
extension HomeView {
    func SortByView() -> some View {
        HStack {
            CommonText(
                title: "Sort By: ",
                fontSize: Constant.FontSize._22FontSize,
                fontStyle: .Regular
            )

            ForEach(SortBy.allCases, id: \.self) { sortCase in
                FilterCell(sortCase: sortCase)
            }
        }
        .padding(.trailing, Constant.setSpace._10Padding)
        .padding(.top, Constant.setSpace._20Padding)
    }
}


///`FilterCell`
extension HomeView {
    func FilterCell(sortCase: SortBy) -> some View {
        Button {
            withAnimation {
                if !self.homeVM.arrBooks.isEmpty {
                    homeVM.sortType = sortCase
                }
            }
        } label: {
            CommonText(
                title: sortCase.rawValue,
                fontSize: Constant.FontSize._20FontSize,
                fontStyle: .SemiBold
            )

            .padding(.vertical, Constant.setSpace._2Padding)
            .padding(.horizontal, Constant.setSpace._14Padding)
            .background(
                homeVM.sortType == sortCase  ? Color.AppPlaceHolderColor.opacity(0.7) :
                        .clear
            )
            .cornerRadius(Constant.setSpace._8Padding)
        }
    }
}

///`SortBy`
extension HomeView {
    enum SortBy: String, CaseIterable {
        case Title
        case Average
        case Hits
    }
}


///`GetSortedData`
extension HomeView {
    func getSortedData() -> [BookData] {
        withAnimation {
            switch self.homeVM.sortType {
            case .Title:
                self.homeVM.arrBooks.sorted(by: {($0.title ?? "") < ($1.title ?? "")})
            case .Average:
                self.homeVM.arrBooks.sorted(by: {($0.ratingsAverage ?? 0) > ($1.ratingsAverage ?? 0)})
            case .Hits:
                self.homeVM.arrBooks.sorted(by: {$0.ratingsCount ?? 0 > $1.ratingsCount ?? 0})
            }
        }
    }
}
