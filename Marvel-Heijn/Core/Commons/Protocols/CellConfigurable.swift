//
//  CellConfigurable.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

protocol CellConfigurable {
    associatedtype Item: Equatable

    var rowHeight: CGFloat { get }

    func configure(with item: Item)
}
