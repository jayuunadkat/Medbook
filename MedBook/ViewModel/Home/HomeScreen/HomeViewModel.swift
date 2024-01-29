//
//  HomeViewModel.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 28/01/24.
//

import Foundation
import SwiftUI
import CoreData

///`HomeViewModel`
class HomeViewModel: ObservableObject {
    @Published var txtSearch: String = ""
    @Published var txtDebouncedSearch: String = ""
    @Published var arrBooks: [BookData] = []
    @Published var savedBooks: [BookData] = []
    var savedBookTitles: [String] {
        savedBooks.map({$0.title ?? ""})
    }
    @Published var sortType: HomeView.SortBy = .Hits
    @Published var showAnimation: Bool = false

    init() {
        setUpDebounce()
    }
}

///`SetupDebounce`
extension HomeViewModel {
    func setUpDebounce() {
        txtDebouncedSearch = self.txtSearch
        $txtSearch
            .debounce(for: .seconds(0.75), scheduler: RunLoop.main)
            .assign(to: &$txtDebouncedSearch)
    }
}


///`getBooks`
extension HomeViewModel {
    func getBooks(isPagination: Bool = false) {
        guard txtSearch.count > 3 else {
            self.arrBooks = txtSearch.isEmpty ? [] : self.arrBooks
            return
        }
        let params: [String : Any] = [
            "title" : txtSearch,
            "limit" : 10,
            "offset" : isPagination ? arrBooks.count : 0
        ]
        if !isPagination {Indicator.show()}
        BooksModel.getBooks(params: params) { [weak self] booksModel in
            Indicator.hide()
            guard let self = self else { return }
            self.showAnimation = true
                if isPagination {
                    self.arrBooks.append(contentsOf: booksModel?.books ?? [])
                } else {

                    self.arrBooks = booksModel?.books ?? []
                }
        }
    }
}

///`PaginateBooks`
extension HomeViewModel {
    func paginateBooks(index: Int) {
        
        guard index + 1 == arrBooks.count else { return }
        getBooks(isPagination: true)
    }
}

///`saveBook`
extension HomeViewModel {
    func saveBook(by title: String, userMOC: NSManagedObjectContext) {
        withAnimation {
            let bookToSave = self.arrBooks.first(where: {$0.title == title})
            let book = UserBooks(context: userMOC)
            book.authorName = bookToSave?.authorName?.first ?? ""
            book.coverImage = Int64(bookToSave?.coverImage ?? 0)
            book.email = UserDefaults.userEmail
            book.id = UUID()
            book.ratingsAverage = bookToSave?.ratingsAverage ?? 0
            book.ratingsCount = Int64(bookToSave?.ratingsCount ?? 0)
            book.title = bookToSave?.title ?? ""

            try? userMOC.save()

            savedBooks.append(contentsOf: arrBooks.filter({$0.title ?? "" == title}))
        }
    }

    ///`deleteBook`
    func deleteBook(by title: String, userMOC: NSManagedObjectContext, bookMarks: FetchedResults<UserBooks>) {
        self.savedBooks.removeAll(where: {$0.title ?? "" == title})
        if let object = bookMarks.first(where: {$0.title ?? "" == title }) {
            userMOC.delete(object)
            try? userMOC.save()
        }
    }
}
