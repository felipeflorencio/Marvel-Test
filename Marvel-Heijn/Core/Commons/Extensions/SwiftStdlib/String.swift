//
//  String.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

extension String {
    var isBlank: Bool {
        let trimmed = trimmingCharacters(in: .whitespaces)
        return trimmed.isEmpty
    }

    var nilIfEmpty: String? {
        isBlank ? nil : self
    }
}
