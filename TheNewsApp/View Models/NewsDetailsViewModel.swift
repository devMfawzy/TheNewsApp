//
//  NewsDetailsViewModel.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import UIKit

class NewsDetailsViewModel: NewsDetailsViewModeling {
    
    private var article: Article
    
    init(model: Article) {
        self.article = model
    }
    
    var imageURL: URL? {
        guard let urlString = article.urlToImage else {
            return nil
        }
        return URL(string: urlString)
    }
    
    var title: String? {
        article.title
    }
    
    var description: String? {
        article.description
    }
    
    var author: String? {
       article.author 
    }
    
    var date: String? {
        guard let dateString = article.publishedAt else {
            return nil
        }
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = dateFormater.date(from: dateString)
        dateFormater.dateFormat = "MMM d, yyyy"
        return dateFormater.string(from: date!)
    }
    
    var content: NSAttributedString? {
        guard let attributedString = article.content?.htmlToAttributedString else {
            return nil
        }
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: NSRange(location: 0, length: attributedString.length))
        return mutableAttributedString
    }
    
    var url: URL? {
        guard let urlString = article.url else {
            return nil
        }
        return URL(string: urlString)
    }
    
}
