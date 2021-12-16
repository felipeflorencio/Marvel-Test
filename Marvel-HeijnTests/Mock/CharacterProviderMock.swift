//
//  CharacterProviderMock.swift
//  Marvel-HeijnTests
//
//  Created by Felipe F Garcia on 16/12/2021.
//

import Foundation
@testable import Marvel_Heijn

class CharacterProviderMock: CharacterProviderProtocol {

    var mockData: Result<CharacterPaginator, Error>?

    func loadCharacters(with parameter: MarvelParameter<CharacterParameter>, result: @escaping (Result<CharacterPaginator, Error>) -> Void) {
        result(mockData!)
    }
}
