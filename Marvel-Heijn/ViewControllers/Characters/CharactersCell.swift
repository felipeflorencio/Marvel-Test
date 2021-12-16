//
//  CharactersCell.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

private enum Constants {
    static let padding: CGFloat = 10
}

class CharactersCell: UITableViewCell {
    // MARK: - Outlets
    private let container = UIView()
    private let characterImageView = UIImageView()
    private let nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*,  unavailable, message: "Use the initializer")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.sizeToFit()
    }

    private func setupUI() {
        selectionStyle = .none

        container.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(container)

        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(characterImageView)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 3
        nameLabel.textAlignment = .left
        nameLabel.lineBreakMode = .byTruncatingTail

        container.addSubview(nameLabel)

        setupConstraints()
    }

    private func setupConstraints() {

        nameLabel.setContentHuggingPriority(.required, for: .vertical)

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            container.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            characterImageView.topAnchor.constraint(equalTo: container.topAnchor),
            characterImageView.leftAnchor.constraint(equalTo: container.leftAnchor),
            characterImageView.rightAnchor.constraint(equalTo: container.rightAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor),

            nameLabel.leftAnchor.constraint(
                equalTo: characterImageView.leftAnchor,
                constant: Constants.padding
            ),
            nameLabel.rightAnchor.constraint(
                greaterThanOrEqualTo: characterImageView.rightAnchor,
                constant: -Constants.padding
            ),
            nameLabel.bottomAnchor.constraint(
                equalTo: characterImageView.bottomAnchor,
                constant: -Constants.padding
            )
        ])
    }
}

// MARK: - CellConfigurable

extension CharactersCell: CellConfigurable {
    var rowHeight: CGFloat {
        return 180
    }

    func configure(with item: CharacterItem) {
        characterImageView.download(image: item.imageURL)
        let font = UIFont.boldSystemFont(ofSize: 15)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.black,
            .backgroundColor: UIColor.white
        ]
        let attributedString = NSAttributedString(string: item.name, attributes: attributes)
        nameLabel.attributedText = attributedString
    }
}
