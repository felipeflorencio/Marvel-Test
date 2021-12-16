//
//  UIImageView.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import Kingfisher
import UIKit

extension UIImageView {
    func download(image url: URL?, placeholder: ImageAsset? = nil) {
        guard let url = url else { return }
        kf.indicatorType = .activity
        kf.setImage(with: url, placeholder: placeholder?.image)
    }
}
