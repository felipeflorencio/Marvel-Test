//
//  CharactersPresenter.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

protocol CharactersPresenterProtocol {
    func characterStateUpdate(with state: CharacterItemState)
}

final class CharactersPresenter: CharactersPresenterProtocol {

    weak var viewController: CharactersViewController?

    func characterStateUpdate(with state: CharacterItemState) {
        viewController?.stateUpdate(state)
    }
}
