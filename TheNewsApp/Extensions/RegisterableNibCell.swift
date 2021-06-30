//
//  RegisterableNibCell.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import UIKit

protocol RegisterableNibCell {
    func registerNibCell(identifiar: String)
}

extension UITableView: RegisterableNibCell {
    
    func registerNibCell(identifiar: String) {
        register(UINib(nibName: identifiar, bundle: nil), forCellReuseIdentifier: identifiar)
    }
    
}
