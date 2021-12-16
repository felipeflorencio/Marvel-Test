//
//  APIClient.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Combine
import CoreNetwork

// MARK: - Typealias

typealias RequestBuilder<T: Entity> = CoreNetwork.RequestBuilder<MarvelResponse<T>>

// MARK: - APIClient

extension APIClient {

    func execute<T: APIRequest, D: Decodable>(
        _ request: T,
        completion: @escaping (Result<Paginator<D>, Error>) -> Void
    ){

        execute(request)
            .then {
            let response = $0 as? MarvelResponse<D>

            if let dataContainer = response?.data {
                completion(.success(dataContainer))
            } else if let message = response?.message {
                completion(.failure(MarvelError(message)))
            } else {
                completion(.failure(MarvelError.general))
            }
        }.catch {
            completion(.failure($0))
        }
    }

}
