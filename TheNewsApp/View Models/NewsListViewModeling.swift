//
//  NewsListViewModeling.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

protocol NewsListViewModeling {
    var numberOfItems: Int { get }
    var newsList: [NewsItemViewModeling] { get }
    var service: NewsServiceProtocol { get }
    var delegate: NewsListViewDelegate? { get }
    var currentPage: Int { get }
    var currentQuery: String? { get }
    var isFetchingData: Bool { get }
    var totalResults: Int? { get }
    var moreToFetch: Bool { get }
    var emptyResultMessage: String { get }
    func fetchNews(query: String)
    func loadMoreNews()
}
