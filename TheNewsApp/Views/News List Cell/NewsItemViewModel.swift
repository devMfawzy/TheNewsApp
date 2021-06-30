//
//  NewsItemViewModel.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

struct NewsItemViewModel: NewsItemViewModeling {
    
    private let model: Article
    
    init(model: Article) {
        self.model = model
    }
    
    var title: String? {
        model.title
    }
    
    var source: String? {
        guard let source = model.source?.name else {
            return nil
        }
        return "Source: \(source)"
    }
    
    var imageUrl: URL? {
        guard let urlString = model.urlToImage else {
            return nil
        }
        return URL(string: urlString)
    }

}

