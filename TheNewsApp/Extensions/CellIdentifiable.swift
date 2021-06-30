//
//  CellIdentifiable.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import UIKit

protocol CellIdentifiable {
    static var cellIdentifier: String { get }
}

extension UITableViewCell: CellIdentifiable {
    
    static var cellIdentifier: String {
        String(describing: self)
    }
    
}
