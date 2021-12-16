//
//  Result.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

extension Result {
    var error: Error? {
        switch self {
        case .success:
            return nil
        case let .failure(error):
            return error
        }
    }
}

extension Result where Success == Void {
    static var success: Self {
        .success(())
    }
}
