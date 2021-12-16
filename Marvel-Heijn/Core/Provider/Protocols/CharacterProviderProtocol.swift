//
//  CharacterProviderProtocol.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

protocol CharacterProviderProtocol {
    func loadCharacters(
        with parameter: MarvelParameter<CharacterParameter>,
        result: @escaping (Result<CharacterPaginator, Error>) -> Void
    )
}
