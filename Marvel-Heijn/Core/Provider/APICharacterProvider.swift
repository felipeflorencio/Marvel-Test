//
//  APICharacterProvider.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Combine
import CoreNetwork

final class APICharacterProvider: CharacterProviderProtocol {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func loadCharacters(
        with parameter: MarvelParameter<CharacterParameter>,
        result: @escaping (Result<CharacterPaginator, Error>) -> Void
    ) {
        let request = RequestBuilder<MarvelCharacter>()
            .path("characters")
            .method(.get)
            .urlParameters(parameter)
            .build()
        apiClient.execute(request, completion: result)
    }
}
