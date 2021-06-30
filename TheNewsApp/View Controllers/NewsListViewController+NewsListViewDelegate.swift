//
//  NewsListViewController+NewsListViewDelegate.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 01/07/2021.
//

import Foundation

extension NewsListViewController: NewsListViewDelegate {
    
    func didBeginNewSearch() {
        tableView.reloadData()
        didBeginLoadingMore()
    }
    
    func didBeginLoadingMore() {
        errorView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func didReceiveNews() {
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
    
    func didReceiveError(_ error: String) {
        activityIndicator.stopAnimating()
        errorLabel.text = error
        errorView.isHidden = false
    }
    
}
