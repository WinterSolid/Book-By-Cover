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
    
    URL = URL.appendingQueryParameters(URLParams)
    var request = URLRequest(url: URL)
    request.httpMethod = "GET"
    
    //New Task
    let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
        if (error == nil) {
            
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("URL Session Task Success: HTTP \(statusCode)")
            guard let jsonData = data
            else {return}
            
            do {
                let bookData = try JSONDecoder().decode(Books.self, from: jsonData)
                completion(bookData)
        }catch {
            print(error)
        }
        }
        else {
            print("URL Session Task Failed: %@", error!.localizedDescription);
        }
        })
        task.resume()
        //session.finishTaskAndInvalidate()
    }
}
protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary: URLQueryParameterStringConvertible {
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}

extension URL {
    func appendingQueryParameters(_ parametersDictionary: Dictionary<String , String>) -> URL {
        let URLString : String = String(format: "$@*$@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}
