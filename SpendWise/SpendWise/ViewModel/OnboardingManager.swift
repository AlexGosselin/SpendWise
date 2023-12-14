//
//  OnboardingManager.swift
//  SpendWise
//
//  Created by ayomide olopha on 13/12/2023.
//

import Foundation

class OnboardingManager {
    static let shared = OnboardingManager()

    private let hasLaunchedKey = "hasLaunched"

    var hasLaunched: Bool {
        return UserDefaults.standard.bool(forKey: hasLaunchedKey)
    }

    func setHasLaunched() {
        UserDefaults.standard.set(true, forKey: hasLaunchedKey)
    }
}

