//
//  NewsDetailsViewModeling.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/05/2021.
//

import Foundation

protocol NewsDetailsViewModeling {
    var imageURL: URL? { get }
    var title: String? { get }
    var description: String? { get }
    var author: String? { get }
    var date: String? { get }
    var content: NSAttributedString? { get }
    var url: URL? { get }
}
