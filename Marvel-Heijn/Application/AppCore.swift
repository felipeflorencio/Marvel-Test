//
//  AppCore.swift
//  Marvel-Heijn
//
//  Created by Felipe F Garcia on 15/12/2021.
//

import CoreNetwork
import Foundation

// MARK: - AppCore

protocol AppCore {
    func apiConfiguration() -> ServiceConfigurator
    func apiClient() -> APIClient
}

// MARK: APIClient
extension AppCore {
    func apiConfiguration() -> ServiceConfigurator {
        ServiceConfigurator()
    }

    func apiClient() -> APIClient {
        DefaultAPIClient(apiConfiguration())
    }
}

// MARK: - DefaultAppCore

struct DefaultAppCore: AppCore {}
