//
//  CharactersWorkerTest.swift
//  Marvel-HeijnTests
//
//  Created by Felipe F Garcia on 16/12/2021.
//

import XCTest
@testable import Marvel_Heijn

class CharactersWorkerTest: XCTestCase {

    let provider = CharacterProviderMock()

    func testWorkerSuccess() throws {
        // Given
        let worker = CharactersWorker(provider: provider)
        let characterPaginator = CharacterPaginator(results: [MarvelCharacter(id: 0, name: "test", description: "none", thumbnail: nil)])

        // When
        provider.mockData = .success(characterPaginator)
        let exp = expectation(description: "Loading Characters")

        var resultResponse: CharacterPaginator!
        worker.loadCharacters(
            with: CharacterParameter(offset: 0)) { result in
                resultResponse = result
                exp.fulfill()
            } failure: { _ in
                fatalError()
            }

        waitForExpectations(timeout: 3)

        // Then
        XCTAssertEqual(resultResponse, characterPaginator)
    }

    func testWorkerFailed() throws {
        // Given
        let worker = CharactersWorker(provider: provider)

        // When
        provider.mockData = .failure(MarvelError.general)
        let exp = expectation(description: "Loading Characters")

        var failureResponse: Error?
        worker.loadCharacters(
            with: CharacterParameter(offset: 0)) { _ in
                fatalError()
            } failure: { error in
                failureResponse = error
                exp.fulfill()
            }

        waitForExpectations(timeout: 3)

        // Then
        XCTAssertNotNil(failureResponse)
    }

}
