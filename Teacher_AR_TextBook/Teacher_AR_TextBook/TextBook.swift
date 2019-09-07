//
//  TextBook.swift
//  
//
//  Created by james luo on 9/7/19.
//

import Foundation
class TextBook{
    var Genre: String
    var BookName: String
    var Level : Int
    var Image: String
    init(BookName: String, Genre: String, Level: Int, Image: String) {
        self.Genre = Genre
        self.BookName = BookName
        self.Level = Level
        self.Image = Image
    }
}
