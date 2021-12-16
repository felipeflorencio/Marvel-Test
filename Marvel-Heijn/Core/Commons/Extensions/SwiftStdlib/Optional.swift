//
//  Optional.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

extension Optional where Wrapped == String {
    var defaultIfEmpty: String {
        switch self {
        case let .some(value):
            return value.nilIfEmpty ?? L10n.Common.notAvailable
        case .none:
            return L10n.Common.notAvailable
        }
    }
}
