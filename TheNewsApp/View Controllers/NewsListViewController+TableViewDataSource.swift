//
//  File.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import UIKit

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.cellIdentifier, for: indexPath)
        if let cell = cell as? NewsListTableViewCell {
            cell.config(viewModel: viewModel.newsList[indexPath.row])
        }
        return cell
    }
    
}
