//
//  BookMarkViewModel.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 29/01/24.
//

import Foundation
import CoreData
import SwiftUI

///`BookMarkViewModel`
class BookMarkViewModel: ObservableObject {
    @Published var bookMarks: [BookData] = []
}

