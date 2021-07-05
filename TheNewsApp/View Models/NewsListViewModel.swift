//
//  NewsListViewModel.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

class NewsListViewModel: NewsListViewModeling {
    
    private var data: NewsListResponse?
    private(set) var newsList: [NewsItemViewModeling] = []
    private(set) var service: NewsServiceProtocol
    private(set) weak var delegate: NewsListViewDelegate?
    private(set) var currentPage = 1
    private(set) var pageSize: Int
    private(set) var currentQuery: String?
    private(set) var isFetchingData: Bool = false
    private(set) var totalResults: Int?
    
    init(service: NewsServiceProtocol, delegate: NewsListViewDelegate, pageSize: Int = API.ParamterValue.pageSize) {
        self.service = service
        self.delegate = delegate
        self.pageSize = pageSize
    }
    
    var numberOfItems: Int {
        return newsList.count
    }
    
    var moreToFetch: Bool {
        guard let totalResults = totalResults else {
            return true
        }
        return totalResults > numberOfItems
    }

    var emptyResultMessage: String {
        var message = "No results"
        if let query = currentQuery {
            message += " with keyword: \(query)"
        }
        return message
    }
    
    func fetchNews(query: String) {
        currentQuery = query
        newsList = []
        totalResults = nil
        currentPage = 1
        if !isFetchingData {
            delegate?.didBeginNewSearch()
            fetchNews(query: query, page: currentPage)
        }
    }
    
    func loadMoreNews() {
        guard let query = currentQuery else {
            return
        }
        if !isFetchingData && moreToFetch {
            delegate?.didBeginLoadingMore()
            fetchNews(query: query, page: currentPage+1)
        }
    }
    
    func fetchNews(query: String, page: Int) {
        isFetchingData = true
        service.getNews(page: page, pageSize: pageSize, query: query) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.data = data
                self.totalResults = data.totalResults
                let articles = data.articles.map {NewsItemViewModel(model: $0) }
                self.newsList.append(contentsOf: articles)
                if self.numberOfItems == 0 {
                    self.delegate?.didReceiveError(self.emptyResultMessage)
                } else {
                    self.currentPage = page
                    self.delegate?.didReceiveNews()
                }
            case .failure(let error):
                self.delegate?.didReceiveError(error)
            }
            self.isFetchingData = false
        }
    }
    
    func detailsItemAt(_ index: Int) -> NewsDetailsViewModeling? {
        guard let article = data?.articles[index] else {
            return nil
        }
        return NewsDetailsViewModel(model: article)
    }
    
}
