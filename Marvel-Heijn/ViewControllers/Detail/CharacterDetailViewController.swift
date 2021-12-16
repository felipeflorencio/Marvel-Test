//
//  CharacterDetailViewController.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

final class CharacterDetailViewController: UIViewController {
    // MARK: - Outlets

    private let containerView = UIView()
    private let characterDetail = CharacterDetailView()

    // MARK: - Properties
    private let interactor: CharacterDetailInteractorProtocol

    init(interactor: CharacterDetailInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*,  unavailable, message: "Use the initializer with parameters")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
        setupUI()
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeData()
    }

    private func setupUI() {

        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)

        characterDetail.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(characterDetail)
        setupConstraints()
    }

    private func setupConstraints() {
        let contentHeightConstraint = characterDetail.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentHeightConstraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentHeightConstraint,
            characterDetail.topAnchor.constraint(equalTo: containerView.topAnchor),
            characterDetail.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            characterDetail.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            characterDetail.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    private func initializeData() {
        interactor.loadItems()
    }
    func characterSetup(_ character: CharacterItem) {
        self.title = character.name
        self.characterDetail.configure(with: character)
        view.layoutIfNeeded()
    }
}
