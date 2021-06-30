//
//  NewsListViewDelegate.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

protocol NewsListViewDelegate: class {
    func didBeginNewSearch()
    func didBeginLoadingMore()
    func didReceiveNews()
    func didReceiveError(_ error: String)
}

