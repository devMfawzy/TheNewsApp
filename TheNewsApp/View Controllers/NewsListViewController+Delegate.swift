//
//  NewsListViewController+Delegate.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import UIKit

extension NewsListViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if searchBar.isFirstResponder {
            searchBar.resignFirstResponder()
        }
        let loadedItemsCount = viewModel.newsList.count
        guard let lastDisplayedRow = tableView.indexPathsForVisibleRows?.last?.row else {
            return
        }
        let displayedItemsCount = lastDisplayedRow + 1
        if Double(displayedItemsCount) / Double(loadedItemsCount) >= loadMoreThreshold {
            viewModel.loadMoreNews()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsItem = viewModel.detailsItemAt(indexPath.row) else {
            return
        }
        let newsItemDetailsViewController = NewsItemDetailsViewController(viewModel: newsItem)
        self.navigationController?.pushViewController(newsItemDetailsViewController, animated: true)
    }
    
}
