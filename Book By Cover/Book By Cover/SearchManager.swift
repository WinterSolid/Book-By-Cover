//
//  SearchManager.swift
//  Book By Cover
//
//  Created by Zakee Tanksley on 9/20/21.
// https://www.googleapis.com/books/v1/volumes?q=search+terms

import Foundation

class SearchManager {
    
    func getBookInfo(isbn: String, completion: @escaping (Books)-> Void) {
        
        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard var URL = URL(string: "https://www.googleapis.com/books/v1/volumes?q=search+terms")
        else {return}
        
        let URLParams = [ "q": "isbn: \(isbn)"]
        URL
    }
    URL = URL.appendingQueryParameters(URLParams)
    var request = URLRequest(url: URL)
    request.httpMethod = "GET"
    
    let task = session.dataTask() //TODO
}
