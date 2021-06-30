//
//  API.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

struct API {
    
    static let baseURL = "https://newsapi.org/v2/everything"
    
    struct ParamterKey {
        static let query = "q"
        static let sort = "sortBy"
        static let api = "apiKey"
        static let pageSize = "pageSize"
        static let page = "page"
    }
    
    struct ParamterValue {
        static let apiKey = "7a39535bc99d443aa390ac8e77d9f5ea"
        static let publishDate = "publishedAt"
        static let pageSize = 20
    }
    
}
