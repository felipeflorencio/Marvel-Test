//
//  CharacterDetailView.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

private enum Constants {
    static let defaultPadding: CGFloat = 10
    static let imageHeight: CGFloat = 350
}

final class CharacterDetailView: UIView {

    private let containerView = UIView()
    private let characterImageView = UIImageView()
    private let nameTitleLabel = UILabel()
    private let nameValueLabel = UILabel()
    private let descriptionTitleLabel = UILabel()
    private let descriptionValueLabel = UILabel()

    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .black
        self.addSubview(containerView)

        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.contentMode = .scaleAspectFill
        containerView.addSubview(characterImageView)

        nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTitleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        nameTitleLabel.textColor = .red
        containerView.addSubview(nameTitleLabel)

        nameValueLabel.translatesAutoresizingMaskIntoConstraints = false
        nameValueLabel.font = UIFont.systemFont(ofSize: 15)
        nameValueLabel.textColor = .white
        nameValueLabel.numberOfLines = 0
        containerView.addSubview(nameValueLabel)

        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        descriptionTitleLabel.textColor = .red
        containerView.addSubview(descriptionTitleLabel)

        descriptionValueLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionValueLabel.font = UIFont.systemFont(ofSize: 15)
        descriptionValueLabel.textColor = .white
        descriptionValueLabel.numberOfLines = 3
        containerView.addSubview(descriptionValueLabel)

        setupConstraints()
    }

    private func setupConstraints() {

        nameTitleLabel.setContentHuggingPriority(.required, for: .vertical)
        nameValueLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        descriptionTitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        descriptionValueLabel.setContentHuggingPriority(.defaultLow, for: .vertical)

        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: super.widthAnchor),
            containerView.topAnchor.constraint(equalTo: super.topAnchor),
            containerView.leftAnchor.constraint(equalTo: super.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: super.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: super.bottomAnchor),

            characterImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            characterImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            characterImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),

            nameTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            nameTitleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            nameTitleLabel.topAnchor.constraint(
                equalTo: characterImageView.bottomAnchor,
                constant: Constants.defaultPadding
            ),
            nameTitleLabel.leftAnchor.constraint(
                equalTo: containerView.leftAnchor,
                constant: Constants.defaultPadding
            ),
            nameTitleLabel.rightAnchor.constraint(
                equalTo: containerView.rightAnchor,
                constant: -Constants.defaultPadding
            ),

            nameValueLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            nameValueLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            nameValueLabel.topAnchor.constraint(
                equalTo: nameTitleLabel.bottomAnchor,
                constant: Constants.defaultPadding
            ),
            nameValueLabel.leftAnchor.constraint(
                equalTo: containerView.leftAnchor,
                constant: Constants.defaultPadding
            ),
            nameValueLabel.rightAnchor.constraint(
                equalTo: containerView.rightAnchor,
                constant: -Constants.defaultPadding
            ),

            descriptionTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            descriptionTitleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            descriptionTitleLabel.topAnchor.constraint(
                equalTo: nameValueLabel.bottomAnchor,
                constant: Constants.defaultPadding
            ),
            descriptionTitleLabel.leftAnchor.constraint(
                equalTo: containerView.leftAnchor,
                constant: Constants.defaultPadding
            ),
            descriptionTitleLabel.rightAnchor.constraint(
                equalTo: containerView.rightAnchor,
                constant: -Constants.defaultPadding
            ),

            descriptionValueLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            descriptionValueLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            descriptionValueLabel.topAnchor.constraint(
                equalTo: descriptionTitleLabel.bottomAnchor,
                constant: Constants.defaultPadding
            ),
            descriptionValueLabel.leftAnchor.constraint(
                equalTo: containerView.leftAnchor,
                constant: Constants.defaultPadding
            ),
            descriptionValueLabel.rightAnchor.constraint(
                equalTo: containerView.rightAnchor,
                constant: -Constants.defaultPadding
            ),
            descriptionValueLabel.bottomAnchor.constraint(
                greaterThanOrEqualTo: containerView.bottomAnchor,
                constant: -Constants.defaultPadding
            )
        ])
    }

    func configure(with item: CharacterItem) {
        characterImageView.download(image: item.imageURL)
        nameTitleLabel.text = item.nameTitle
        nameValueLabel.text = item.name
        descriptionTitleLabel.text = item.descriptionTitle
        descriptionValueLabel.text = item.description
    }
}
