//
//  Article.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

struct Article: Decodable {
    var source: NewsSource?
    var title: String?
    var urlToImage: String?
}
