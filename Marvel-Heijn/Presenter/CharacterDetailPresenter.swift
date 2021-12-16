//
//  CharacterDetailPresenter.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

protocol CharacterDetailPresenterProtocol {
    func characterSetup(_ character: CharacterItem)
}

final class CharacterDetailPresenter: CharacterDetailPresenterProtocol {

    weak var viewController: CharacterDetailViewController?

    func characterSetup(_ character: CharacterItem) {
        viewController?.characterSetup(character)
    }
}
