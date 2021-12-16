//
//  ThemeApplicationPrototype.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

final class ThemeApplicationPrototype {
    static func setup() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = Colors.white.color
        UINavigationBar.appearance().barTintColor = Colors.primary.color
        UINavigationBar.appearance().backgroundColor = Colors.primary.color
        UINavigationBar.appearance().titleTextAttributes = titleTextAttributes(with: Colors.white, and: 17)
        
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .semibold)],
            for: .normal
        )
        
        UIBarButtonItem.appearance().setTitleTextAttributes(
            titleTextAttributes(with: Colors.white, and: 14),
            for: .normal
        )
        
        UISwitch.appearance().onTintColor = Colors.primary.color.withAlphaComponent(0.3)
        UISwitch.appearance().thumbTintColor = Colors.primary.color
        
        UISegmentedControl.appearance().tintColor = Colors.primary.color
        
        UITableViewCell.appearance().tintColor = Colors.primary.color
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    private static func titleTextAttributes(
        with colorAsset: ColorAsset,
        and fontSize: CGFloat
    ) -> [NSAttributedString.Key: Any]? {
        [
            NSAttributedString.Key.foregroundColor: colorAsset.color,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        ]
    }
}
