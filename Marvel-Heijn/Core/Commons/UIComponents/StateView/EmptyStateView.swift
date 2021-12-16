//
//  EmptyStateView.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

final class EmptyStateView: UIView {
    // MARK: Outlets

    @IBOutlet private var descriptionLabel: UILabel! {
        didSet { descriptionLabel.text = L10n.State.empty }
    }
}
