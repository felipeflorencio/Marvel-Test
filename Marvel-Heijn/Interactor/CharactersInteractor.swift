//
//  CharactersInteractor.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Foundation

typealias CharacterItemState = State<CharacterItem>

protocol CharactersInteractorProtocol {
    var state: CharacterItemState { get }

    func loadCharacters()
    func loadCharacters(at offset: Int)
}

final class CharactersInteractor: CharactersInteractorProtocol {
    
    private let presenter: CharactersPresenterProtocol
    private let worker: CharactersWorkerProtocol
    private let dispatcher: DispatcherProtocol
    
    private var _state: CharacterItemState = .empty {
        didSet {
            presenter.characterStateUpdate(with: state)
        }
    }
    var state: CharacterItemState {
        return _state
    }

    private(set) var shouldLoadCharacters = true

    // MARK: - Init
    init(
        presenter: CharactersPresenterProtocol,
        worker: CharactersWorkerProtocol,
        dispatcher: DispatcherProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dispatcher = dispatcher
    }
    
    func loadCharacters() {
        _state = .loading
        presenter.characterStateUpdate(with: state)
        dispatcher.dispatch { [weak self] in self?.loadCharacters(at: 0) }
    }
    
    func loadCharacters(at offset: Int) {
        guard shouldLoadCharacters else { return }
        shouldLoadCharacters = false
        let parameter = CharacterParameter(offset: offset)

        worker
            .loadCharacters(
                with: parameter) { [weak self] characterPaginator in
                    self?.shouldLoadCharacters = true
                    self?.handleCharacters(paginator: characterPaginator)
                } failure: { [weak self] error in
                    guard let weakSelf = self else { return }
                    weakSelf.shouldLoadCharacters = true
                    weakSelf._state = .error(error)
                    weakSelf.presenter.characterStateUpdate(with: weakSelf.state)
                }
    }

    private func handleCharacters(paginator: Paginator<MarvelCharacter>) {
        let items = paginator.results.map(CharacterItem.init)

        var allItems = state.items
        allItems.append(contentsOf: items)

        if paginator.hasMorePages {
            _state = .paging(allItems, next: paginator.nextOffset)
        } else {
            _state = .populated(allItems)
        }

        presenter.characterStateUpdate(with: state)
    }
}
