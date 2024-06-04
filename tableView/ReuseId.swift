//
//  ReuseId.swift
//  tableView
//
//  Created by ilim on 2024-06-04.
//

import UIKit

protocol ReuseIdentifierProtocol {
    static var identifier: String { get }
}

extension UIViewController: ReuseIdentifierProtocol {
    static var identifier: String {
        String(describing: self)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
