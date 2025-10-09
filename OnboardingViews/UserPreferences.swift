//
//  UserPreferences.swift
//  OnboardingViews
//
//  Created by Spencer Searle on 10/8/25.
//

import Foundation
import Combine
import SwiftUI

@Observable
class UserPreferences: ObservableObject {
    // Explicitly declare objectWillChange for ObservableObject conformance
    let objectWillChange = ObservableObjectPublisher()
    
    var selectedDiets: Set<String> = [] {
        didSet {
            objectWillChange.send() // Notify when changed
        }
    }
    var selectedAllergies: [String] = [] {
        didSet {
            objectWillChange.send() // Notify when changed
        }
    }
    var selectedCookingTime: String? {
        didSet {
            objectWillChange.send() // Notify when changed
        }
    }
    var selectedServings: String? {
        didSet {
            objectWillChange.send() // Notify when changed
        }
    }
    
    var cookingTimeDisplay: String {
        selectedCookingTime ?? "Not specified"
    }
    
    var servingsDisplay: String {
        selectedServings ?? "Not specified"
    }
    
    func saveToUserDefaults() {
        UserDefaults.standard.set(Array(selectedDiets), forKey: "selectedDiets")
        UserDefaults.standard.set(selectedAllergies, forKey: "selectedAllergies")
        UserDefaults.standard.set(selectedCookingTime, forKey: "selectedCookingTime")
        UserDefaults.standard.set(selectedServings, forKey: "selectedServings")
        print("Preferences saved: Diets: \(selectedDiets), Allergies: \(selectedAllergies), Time: \(cookingTimeDisplay), Servings: \(servingsDisplay)")
    }
    
    func loadFromUserDefaults() {
        if let dietsArray = UserDefaults.standard.array(forKey: "selectedDiets") as? [String] {
            selectedDiets = Set(dietsArray)
        }
        selectedAllergies = UserDefaults.standard.array(forKey: "selectedAllergies") as? [String] ?? []
        selectedCookingTime = UserDefaults.standard.string(forKey: "selectedCookingTime")
        selectedServings = UserDefaults.standard.string(forKey: "selectedServings")
        print("Preferences loaded: Diets: \(selectedDiets), Allergies: \(selectedAllergies), Time: \(cookingTimeDisplay), Servings: \(servingsDisplay)")
    }
}
