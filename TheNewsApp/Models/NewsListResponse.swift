//
//  NewsListResponse.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

struct NewsListResponse: Decodable {
    var totalResults: Int
    var articles: [Article]
}
