//
//  Environment.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

enum Environment {
    case debug
    case release

    var isDebug: Bool { self == .debug }
    var isRelease: Bool { self == .release }
}

var environment: Environment {
    #if DEBUG
    return .debug
    #else
    return .release
    #endif
}
