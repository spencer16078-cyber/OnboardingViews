//
//  CookingPreferencesView.swift
//  OnboardingViews
//
//  Created by Spencer Searle on 10/6/25.
//

import SwiftUI

struct CookingOption: Identifiable, Hashable {
    var id: String
    var emoji: String
    var label: String
    var detail: String

    static func make(id: String, emoji: String, label: String, detail: String) -> CookingOption {
        CookingOption(id: id, emoji: emoji, label: label, detail: detail)
    }
}

@MainActor
struct CookingPreferencesView: View {
    static let options: [CookingOption] = [
        .make(id: "1", emoji: "⚡️", label: "Quick & Easy", detail: "<30 min"),
        .make(id: "2", emoji: "🍳", label: "Moderate", detail: "30-60 min"),
        .make(id: "3", emoji: "👨‍🍳", label: "Elaborate", detail: ">60 min"),
        .make(id: "4", emoji: "👤", label: "Just me", detail: "1 - 2 people"),
        .make(id: "5", emoji: "👨‍👩‍👧", label: "Small Family", detail: "3 - 4 people"),
        .make(id: "6", emoji: "👨‍👩‍👧‍👦", label: "Large Group", detail: "5+ people")
    ]
    
    let cookingOptions: [CookingOption] = CookingPreferencesView.options

    @EnvironmentObject var preferences: UserPreferences  // Inject shared model
    @Environment(\.dismiss) var dismissScreen
    
    // Computed for form validation
    private var isFormComplete: Bool {
        preferences.selectedCookingTime != nil && preferences.selectedServings != nil
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 12) {
                // clock label
                Image(systemName: "clock")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.accent)
                    .padding(12)
                    .background(Color.secondaryAccent)
                    .clipShape(Circle())
                    
                // text
                Text("Your cooking preferences")
                    .font(.custom("Montserrat-Bold", size: 24))
                    .foregroundStyle(.mainText)
                Text("We'll match recipes to your lifestyle")
                    .font(.custom("Montserrat-Medium", size: 16))
                    .foregroundStyle(Color.greenText)
                    .multilineTextAlignment(.center)
            }
            .padding()
            
            VStack(alignment: .leading) {
                
                TimeOptionsSection(
                    options: Array(cookingOptions.prefix(3)),
                    selectedID: Binding(  // Bind to shared
                        get: { // Find ID where detail matches selectedCookingTime
                            cookingOptions.first { $0.detail == preferences.selectedCookingTime }?.id ?? "" },
                        set: { newValue in
                            if newValue.isEmpty {
                                preferences.selectedCookingTime = nil
                            } else {
                                // Find detail by ID (assuming IDs 1-3 for time)
                                preferences.selectedCookingTime = cookingOptions.first(where: { $0.id == newValue })?.detail
                            }
                        }
                    )
                )
                                
                ServingOptionsSection(
                    options: Array(cookingOptions.suffix(3)),
                    selectedID: Binding(  // Bind to shared
                        get: { cookingOptions.first { $0.detail == preferences.selectedServings }?.id ?? "" },
                        set: { newValue in
                            if newValue.isEmpty {
                                preferences.selectedServings = nil
                            } else {
                                // Find detail by ID (assuming IDs 4-6 for servings)
                                preferences.selectedServings = cookingOptions.first(where: { $0.id == newValue })?.detail
                            }
                        }
                    )
                )
                
                HStack(spacing: 10) {
                    Button {
                        dismissScreen()
                    } label: {
                        Text("Back")
                            .font(.custom("Montserrat-Medium", size: 16))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.buttonFill)
                            .cornerRadius(12)
                    }
                    
                    NavigationLink {
                        FinalPreferencesView()  // No parameters needed now
                    } label: {
                        Text("Finish")
                            .font(.custom("Montserrat-Semibold", size: 16))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors:[.secondaryAccent, .accent], startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .disabled(!isFormComplete)
                    .opacity(isFormComplete ? 1 : 0.5)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .background(Color.primaryBackground)
        .onAppear {
            print("CookingPreferencesView loaded: Current time = \(preferences.cookingTimeDisplay), servings = \(preferences.servingsDisplay)")  // Debug
        }
    }
    
    private struct TimeOptionsSection: View {
        let options: [CookingOption]
        @Binding var selectedID: String  // Now bound to shared via parent

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "clock")
                        .foregroundStyle(.accent)
                    Text("How much time do you have?")
                        .font(.custom("Montserrat-Semibold", size: 16))
                }

                ForEach(options) { data in
                    CookingCard(
                        option: data,
                        isSelected: selectedID == data.id,
                        action: {
                            selectedID = (selectedID == data.id) ? "" : data.id  // Toggle
                        }
                    )
                }
            }
        }
    }

    private struct ServingOptionsSection: View {
        let options: [CookingOption]
        @Binding var selectedID: String  // Now bound to shared via parent

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "person.2")
                        .foregroundStyle(.accent)
                    Text("How many servings?")
                        .font(.custom("Montserrat-Semibold", size: 16))
                }
                .padding(.top, 10)

                ForEach(options) { data in
                    CookingCard(
                        option: data,
                        isSelected: selectedID == data.id,
                        action: {
                            selectedID = (selectedID == data.id) ? "" : data.id  // Toggle
                        }
                    )
                }
            }
        }
    }
    
    private struct CookingCard: View {
        let option: CookingOption
        let isSelected: Bool
        let action: () -> Void
        
        var body: some View {
            Button(role: nil, action: action) {
                ZStack(alignment: .trailing) {
                    
                    HStack {
                        
                        HStack(spacing: 10) {
                            Text(option.emoji)
                                .font(.system(size: 24))
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(option.label)
                                    .font(.custom("Montserrat-Semibold", size: 14))
                                    .foregroundStyle(.mainText)
                                
                                Text(option.detail)
                                    .font(.custom("Montserrat-Medium", size: 12))
                                    .foregroundStyle(.greenText)
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(isSelected ? Color.accent.opacity(0.1) : Color.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Color.accent : Color.gray.opacity(0.2), lineWidth: 2))
                    .padding(5)
                    
                    if isSelected {
                        Image(systemName: "checkmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                            .background(Color.accent)
                            .clipShape(Circle())
                            .padding()
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    CookingPreferencesView()
        .environmentObject(UserPreferences())  // For preview
}
