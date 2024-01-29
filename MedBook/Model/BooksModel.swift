//
//  BooksModel.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 28/01/24.
//

import Foundation
import SwiftUI

///`CountryData`
struct BooksModel: Codable, Hashable, Equatable {
    let numFound, start: Int?
    let numFoundExact: Bool?
    let books: [BookData]?
    let booksModelNumFound: Int?
    let q: String?
    let offset: Int?

    enum CodingKeys: String, CodingKey {
        case numFound, start, numFoundExact
        case books = "docs"
        case booksModelNumFound = "num_found"
        case q, offset
    }
}

///`BookData`
struct BookData: Codable, Hashable, Equatable {
    let title: String?
    let authorName: [String]?
    let coverImage, ratingsCount: UInt64?
    let ratingsAverage: Double?
    var fullImageURL: String {
        "https://covers.openlibrary.org/b/id/\(self.coverImage ?? 0)-M.jpg"
    }

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case coverImage = "cover_i"
        case authorName = "author_name"
        case ratingsCount = "ratings_count"
        case ratingsAverage = "ratings_average"
    }
}

///`GetCountries`
extension BooksModel {
    static func getBooks(params: [String:Any], completion: @escaping ((_ booksModel: BooksModel?) -> ())) {
        if var url = URL(string: "https://openlibrary.org/search.json") {
            
            for (key, value) in params {
                url = url.appending(key, value: value as? String ?? "")
            }


            APIManager.makeRequest(with: url.absoluteString, method: .get, parameter: params) { response in
                guard let json = response as? [String: Any] else { return }
                guard let data = try? JSONSerialization.data(withJSONObject: json) else { return }

                do {
                    let booksModel = try JSONDecoder().decode(BooksModel.self, from: data)

                    completion(booksModel)
                } catch let error {
                    print("Error >> \(error.localizedDescription)")
                }
            } failure: { error, errorcode, isAuth in
                Alert.show(message: error)
            } connectionFailed: { error in
                Alert.show(message: error)
            }
        }
    }
}
