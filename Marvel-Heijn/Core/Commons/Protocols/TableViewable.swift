//
//  TableViewable.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

protocol TableViewable {
    func display<Value>(_ state: State<Value>)
}

extension UITableView: TableViewable {
    func display<Value>(_ state: State<Value>) {
        switch state {
        case .idle:
            tableFooterView = UIView(frame: .zero)
            backgroundView = nil
        case .loading:
            backgroundView = LoadingStateView.instantiateFromNib()
            tableFooterView = UIView(frame: .zero)
        case .empty:
            backgroundView = EmptyStateView.instantiateFromNib()
            tableFooterView = UIView(frame: .zero)
        case let .error(error):
            let errorView = ErrorStateView.instantiateFromNib()
            errorView.display(message: error.localizedDescription)
            backgroundView = errorView
            tableFooterView = UIView(frame: .zero)
        case .paging:
            tableFooterView = LoadingStateView.instantiateFromNib()
        case let .populated(items):
            if items.isEmpty {
                backgroundView = EmptyStateView.instantiateFromNib()
            } else {
                backgroundView = nil
            }
            tableFooterView = UIView(frame: .zero)
        }
        reloadData()
    }
}
