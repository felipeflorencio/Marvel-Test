//
//  ReusableView.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
