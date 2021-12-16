//
//  CharacterDetailInteractor.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

protocol CharacterDetailInteractorProtocol {
    func loadItems()
}

final class CharacterDetailInteractor: CharacterDetailInteractorProtocol {

    private let character: CharacterItem
    private let presenter: CharacterDetailPresenterProtocol

    // MARK: - Init
    init(
        character: CharacterItem,
        presenter: CharacterDetailPresenterProtocol
    ) {
        self.character = character
        self.presenter = presenter
    }

    func loadItems() {
        presenter.characterSetup(character)
    }
}
