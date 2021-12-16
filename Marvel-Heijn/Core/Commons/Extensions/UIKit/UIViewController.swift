//
//  UIViewController.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

extension UINavigationController {

    func show<T: UIViewController>(
        _ viewController: T,
        animated: Bool = true
    ) {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.title = ""
        navigationItem.backBarButtonItem = barButtonItem
        pushViewController(viewController, animated: animated)
    }
}
