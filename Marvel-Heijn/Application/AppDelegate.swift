//
//  AppDelegate.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let uiWindow = UIWindow(frame: UIScreen.main.bounds)
        window = uiWindow

        ThemeApplicationPrototype.setup()

        DefaultAppCoordinator(window: uiWindow).start()        

        return true
    }
}
