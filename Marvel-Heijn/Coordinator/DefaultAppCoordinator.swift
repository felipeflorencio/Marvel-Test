//
//  DefaultAppCoordinator.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

final class DefaultAppCoordinator {
    
    private let window: UIWindow
    private var mainNavigationController: UINavigationController!
    let core = DefaultAppCore()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        // This ideally would be done in a resolver
        let presenter = CharactersPresenter()
        let provider = APICharacterProvider(apiClient: core.apiClient())
        let worker = CharactersWorker(provider: provider)
        let interactor = CharactersInteractor(
            presenter: presenter,
            worker: worker,
            dispatcher: Dispatcher(minimumDelay: 0.3))
        let viewController = CharactersViewController(
            interactor: interactor,
            coordinator: self
        )
        presenter.viewController = viewController

        mainNavigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
    }
    
    func showDetails(for item: CharacterItem) {
        let presenter = CharacterDetailPresenter()
        let interactor = CharacterDetailInteractor(
            character: item,
            presenter: presenter
        )
        let viewController = CharacterDetailViewController(
            interactor: interactor
        )
        presenter.viewController = viewController

        mainNavigationController.show(viewController)
    }
}
