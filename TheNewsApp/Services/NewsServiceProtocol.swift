//
//  NewsServiceProtocol.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

protocol NewsServiceProtocol {
    func getNews(page: Int, pageSize: Int, query: String, completion: @escaping (GetNewsResult)->Void)
}
