//
//  CharactersViewController.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

final class CharactersViewController: UIViewController {
    // MARK: - Outlets

    private let tableView = UITableView()
    private let container = UIView()

    // MARK: - Properties
    private let dataSource: TableDataSource<CharactersCell>
    private let interactor: CharactersInteractorProtocol
    private let coordinator: DefaultAppCoordinator

    init(
        interactor: CharactersInteractorProtocol,
        coordinator: DefaultAppCoordinator
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
        self.dataSource = TableDataSource<CharactersCell>(tableView)
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
        navigationItem.titleView = UIImageView(image: Images.logo.image)

        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(tableView)

        setupConstraints()
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leftAnchor.constraint(equalTo: view.leftAnchor),
            container.rightAnchor.constraint(equalTo: view.rightAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            tableView.topAnchor.constraint(equalTo: container.topAnchor),
            tableView.leftAnchor.constraint(equalTo: container.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: container.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }

    private func initializeData() {
        interactor.loadCharacters()
        dataSource.pagingHandler = { [weak self] in
            self?.interactor.loadCharacters(at: $0)
        }
        dataSource.didSelectHandler = { [weak self] in self?.didSelectRow(at: $0) }
    }

    func stateUpdate(_ state: CharacterItemState) {
        self.dataSource.state = state
    }

    private func didSelectRow(at indexPath: IndexPath) {
        let item = interactor.state.items[indexPath.row]
        coordinator.showDetails(for: item)
    }
}
