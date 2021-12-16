//
//  CharactersWorker.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

protocol CharactersWorkerProtocol {
    func loadCharacters(
        with parameter: CharacterParameter,
        completion: @escaping (CharacterPaginator) -> Void,
        failure: @escaping (Error) -> Void
    )
}

typealias CharacterPaginator = Paginator<MarvelCharacter>

struct CharacterParameter: Parameter {
    private let offset: Int
    private let limit: Int

    init(
        offset: Int,
        limit: Int = Config.pageLimit
    ) {
        self.offset = offset
        self.limit = limit
    }
}

final class CharactersWorker: CharactersWorkerProtocol {

    private let provider: CharacterProviderProtocol

    init(provider: CharacterProviderProtocol) {
        self.provider = provider
    }

    func loadCharacters(
        with parameter: CharacterParameter,
        completion: @escaping (CharacterPaginator) -> Void,
        failure: @escaping (Error) -> Void
    ) {
        provider
            .loadCharacters(
                with: .init(parameter)) { result in
                    switch result {
                    case .success(let response):
                        completion(response)
                    case .failure(let error):
                        failure(error)
                    }
                }
    }
}
