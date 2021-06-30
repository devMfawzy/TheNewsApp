//
//  NewsItemViewModeling.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

protocol NewsItemViewModeling {
    var title: String? { get }
    var source: String? { get }
    var imageUrl: URL? { get }
}
