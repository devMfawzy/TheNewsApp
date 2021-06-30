//
//  getNewsResult.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Foundation

enum GetNewsResult {
    case success(_ data: NewsListResponse)
    case failure(_ error: String)
}
