//
//  Book.swift
//  Book By Cover
//
//  Created by Zakee Tanksley on 9/20/21.
//

import Foundation

struct Books: Decodable {
    var items: [Bookitem]
    
}
struct BookItem: Decodable {
    var id: String
    var volumeInfo: VolumeInfo
    
}
struct VolumeInfo: Decodable {
    let title: String
    let authors: [String]
    let publishDate: String
    let isbn: String
}
