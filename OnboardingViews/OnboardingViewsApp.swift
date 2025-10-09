//
//  OnboardingViewsApp.swift
//  OnboardingViews
//
//  Created by Spencer Searle on 10/2/25.
//

import SwiftUI

@main
struct OnboardingViewsApp: App {
    @StateObject private var preferences = UserPreferences()
    
    init() {
        // Load saved preferences if user has completed onboarding before
        preferences.loadFromUserDefaults()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environmentObject(preferences)  // Injects to all child views via NavigationStack
        }
    }
}
