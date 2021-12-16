//
//  Image.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

struct Image: Entity {
    private let path: String
    private let `extension`: String

    var url: URL? { URL(string: "\(path).\(`extension`)") }

    init(path: String, extension: String) {
        self.path = path
        self.extension = `extension`
    }
}
