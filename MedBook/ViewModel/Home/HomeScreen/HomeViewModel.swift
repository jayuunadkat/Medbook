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
        guard txtSearch.count > 3 else { return }
        let params: [String : Any] = [
            "title" : txtSearch,
            "limit" : 10,
            "offset" : isPagination ? arrBooks.count : 0
        ]
        BooksModel.getBooks(params: params) { [weak self] booksModel in
            guard let self = self else { return }
            var filteredBookData: [BookData] = []
            self.showAnimation = true
                if isPagination {
                    filteredBookData = booksModel?.books?.filter({self.savedBookTitles.contains($0.title ?? "") == false}) ?? []
                    self.arrBooks.append(contentsOf: booksModel?.books ?? [])
                } else {
                    filteredBookData = booksModel?.books?.filter({self.savedBookTitles.contains($0.title ?? "") == false}) ?? []
                    self.arrBooks = filteredBookData
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
            self.arrBooks.removeAll(where: {$0.title ?? "" == title})
        }
    }
}

extension HomeViewModel {
    func applySorting() {
        
    }
}
