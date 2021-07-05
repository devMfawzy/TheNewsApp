//
//  NewsDetailsTests.swift
//  TheNewsAppTests
//
//  Created by Mohamed Fawzy on 05/07/2021.
//

import XCTest
@testable import TheNewsApp

class NewsDetailsTests: XCTestCase {

    var sut: NewsItemDetailsViewController!

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_article_title_isSetTo_viewTitle() throws {
        // given
        let title = "text title"
        let article = Article(source: nil, title: title, urlToImage: nil, author: nil, description: nil, url: nil, publishedAt: nil, content: nil)
        // when
        let viewModel = NewsDetailsViewModel(model: article)
        sut = NewsItemDetailsViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(viewModel.title, title)
        XCTAssertEqual(sut.title, viewModel.title)
    }

    func test_article_description_is_set() throws {
        // given
        let desc = "descrption test"
        let article = Article(source: nil, title: nil, urlToImage: nil, author: nil, description: desc, url: nil, publishedAt: nil, content: nil)
        // when
        let viewModel = NewsDetailsViewModel(model: article)
        sut = NewsItemDetailsViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(viewModel.description, desc)
        XCTAssertEqual(sut.descriptionLabel.text, viewModel.description)
    }
    
    func test_article_author_is_set() throws {
        // given
        let auther = "adam"
        let article = Article(source: nil, title: nil, urlToImage: nil, author: auther, description: nil, url: nil, publishedAt: nil, content: nil)
        // when
        let viewModel = NewsDetailsViewModel(model: article)
        sut = NewsItemDetailsViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(viewModel.author, auther)
        XCTAssertEqual(sut.autherLabel.text, viewModel.author)
    }
    
    func test_article_date_is_set() throws {
        // given
        let publishedAt = "2021-07-05T17:20:31Z"
        let article = Article(source: nil, title: nil, urlToImage: nil, author: nil, description: nil, url: nil, publishedAt: publishedAt, content: nil)
        // when
        let viewModel = NewsDetailsViewModel(model: article)
        sut = NewsItemDetailsViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(viewModel.date, "Jul 5, 2021")
        XCTAssertEqual(sut.publishDateLabel.text, viewModel.date)
    }
    
    func test_article_inline_content_isSet_without_newLine() throws {
        // given
        let content = "<span>content</span>"
        let article = Article(source: nil, title: nil, urlToImage: nil, author: nil, description: nil, url: nil, publishedAt: nil, content: content)
        // when
        let viewModel = NewsDetailsViewModel(model: article)
        sut = NewsItemDetailsViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(viewModel.content?.string, "content")
        XCTAssertEqual(sut.contentLabel.text, viewModel.content?.string)
    }
    
    func test_articleWith_block_content_isSet_with_newLine() throws {
        // given
        let content = "<p>content</p>"
        let article = Article(source: nil, title: nil, urlToImage: nil, author: nil, description: nil, url: nil, publishedAt: nil, content: content)
        // when
        let viewModel = NewsDetailsViewModel(model: article)
        sut = NewsItemDetailsViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(viewModel.content?.string, "content\n")
        XCTAssertEqual(sut.contentLabel.text, viewModel.content?.string)
    }
    

}
