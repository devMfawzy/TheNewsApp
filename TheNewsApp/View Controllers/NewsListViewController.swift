//
//  ViewController.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet private(set) weak var searchBar: UISearchBar!
    @IBOutlet private(set) weak var tableView: UITableView!
    @IBOutlet private(set) weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private(set) weak var errorView: UIView!
    @IBOutlet private(set) weak var errorLabel: UILabel!

    private let tableContentInset = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
    private(set) var loadMoreThreshold = 0.75

    lazy var viewModel: NewsListViewModeling = NewsListViewModel(service: NewsService(), delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.becomeFirstResponder()
    }
    
    private func setupViews() {
        setupNavigationController()
        setupSearchBar()
        setupTableView()
        title = "News"
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barTintColor = .babyBlue
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setupSearchBar() {
        searchBar.barStyle = .default
        searchBar.isTranslucent = false
        searchBar.barTintColor = .babyBlue
        searchBar.backgroundImage = UIImage()
        searchBar.setTextFieldBackgroundColor(.white)
    }
    
    private func setupTableView() {
        tableView.contentInset = tableContentInset
        tableView.registerNibCell(identifiar: NewsListTableViewCell.cellIdentifier)
    }
    
}


extension NewsListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else {
            return
        }
        searchBar.resignFirstResponder()
        viewModel.fetchNews(query: text)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        errorView.isHidden = true
    }

}

