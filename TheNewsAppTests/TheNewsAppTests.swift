//
//  TheNewsAppTests.swift
//  TheNewsAppTests
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import XCTest
@testable import TheNewsApp

class TheNewsAppTests: XCTestCase {

    var sut: NewsListViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? UINavigationController
        sut = navigationController?.topViewController as? NewsListViewController
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_if_emty_result_should_show_emty_errorMessage() throws {
        // given
        let emptyResponse = NewsListResponse(totalResults: 0, articles: [])
        let service = NewsServiceMock(model: emptyResponse, pageSize: 0)
        // when
        sut.viewModel = NewsListViewModel(service: service, delegate: sut)
        sut.loadViewIfNeeded()
        sut.viewModel.fetchNews(query: "any")
        // then
        XCTAssertFalse(sut.errorView.isHidden)
        XCTAssertEqual(sut.errorLabel.text, "No results with keyword: any")
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0),0)
    }
    
    func test_if_error_returned_by_service() throws {
        // given
        let errorMessage = "server error"
        let service = NewsServiceMock(errorMessage: errorMessage)
        // when
        sut.viewModel = NewsListViewModel(service: service, delegate: sut)
        sut.loadViewIfNeeded()
        sut.viewModel.fetchNews(query: "any")
        // then
        XCTAssertFalse(sut.errorView.isHidden)
        XCTAssertEqual(sut.errorLabel.text, errorMessage)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0),0)

    }
    
    func test_fetch_page_should_only_items_of_page_size() {
        // given
        let totalItems = 4
        let pageSize = 2
        var articles = [Article]()
        for i in (0..<totalItems) {
            articles.append(Article(source: NewsSource(name: "source \(i)"), title: "title \(i)", urlToImage: nil))
        }
        let model = NewsListResponse(totalResults: pageSize, articles: articles)
        let service = NewsServiceMock(model: model, pageSize: pageSize)
        // when
        sut.viewModel = NewsListViewModel(service: service, delegate: sut, pageSize: pageSize)
        sut.loadViewIfNeeded()
        sut.viewModel.fetchNews(query: "title")
        // then
        XCTAssertTrue(sut.errorView.isHidden)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0) ,pageSize)
    }
    
    func test_NewsCell_if_article_doesnot_have_title_shoudBe_hidden() {
        let pageSize = 1
        let article = Article(source: NewsSource(name: "source 1"), title: nil, urlToImage: nil)
        let model = NewsListResponse(totalResults: pageSize, articles: [article])
        let service = NewsServiceMock(model: model, pageSize: pageSize)
        // when
        sut.viewModel = NewsListViewModel(service: service, delegate: sut, pageSize: pageSize)
        sut.loadViewIfNeeded()
        sut.viewModel.fetchNews(query: "source 1")
        // then
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! NewsListTableViewCell
        XCTAssertTrue(cell.titleLabel.isHidden)
    }
    
    func test_NewsCell_if_article_doesnot_have_source_shoudBe_hidden() {
        let pageSize = 1
        let article = Article(source: NewsSource(name: nil), title: "any titke", urlToImage: nil)
        let model = NewsListResponse(totalResults: pageSize, articles: [article])
        let service = NewsServiceMock(model: model, pageSize: pageSize)
        // when
        sut.viewModel = NewsListViewModel(service: service, delegate: sut, pageSize: pageSize)
        sut.loadViewIfNeeded()
        sut.viewModel.fetchNews(query: "any")
        // then
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! NewsListTableViewCell
        XCTAssertTrue(cell.sourceLabel.isHidden)
    }
    
    
}

class NewsServiceMock: NewsServiceProtocol {
    
    var model: NewsListResponse?
    var errorMessage: String?
    var totalResults: Int = 0
    
    init(model: NewsListResponse, pageSize: Int) {
        self.totalResults = model.totalResults
        self.model = model
    }
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
        
    func getNews(page: Int, pageSize: Int, query: String, completion: @escaping (GetNewsResult) -> Void) {
        if let errorMessage = errorMessage {
            completion(.failure(errorMessage))
        } else if let articles = model?.articles {
            let articles = filterData(articles: articles, page: page, pageSize: pageSize, query: query)
            completion(.success( NewsListResponse(totalResults: totalResults, articles: articles)))
        }
    }
    
    func filterData(articles: [Article], page: Int, pageSize: Int, query: String) -> [Article] {
        var articles = articles.filter { $0.title?.contains(query) ?? false || $0.source?.name?.contains(query) ?? false }
        guard articles.count > 1 else {
            return articles
        }
        var pages = [Int: [Article]]()
        var pageNumber = 0
        repeat {
            let page = Array(articles[0..<pageSize])
            pages[pageNumber] = page
            articles.removeFirst(pageSize)
            pageNumber += 1
        } while pageNumber == page
        return pages[page] ?? []
    }

}
