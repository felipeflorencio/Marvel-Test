//
//  ParallelogramView.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

final class ErrorStateView: UIView {
    // MARK: Outlets

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
}

// MARK: - Presentation

extension ErrorStateView {
    func display(message: String) {
        titleLabel.text = L10n.State.error
        descriptionLabel.text = message
    }
}
