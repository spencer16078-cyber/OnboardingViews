//
//  FinalPreferencesView.swift
//  OnboardingViews
//
//  Created by Spencer Searle on 10/7/25.
//

import SwiftUI

private enum FinalPreferencesRoute: Hashable {
    case login
}

struct FinalPreferencesView: View {
    @State private var routeSelection: FinalPreferencesRoute?
    @EnvironmentObject var preferences: UserPreferences  // Inject shared model
    @Environment(\.dismiss) var dismissScreen  // For back navigation if needed
    
    // Computed for display (map diet IDs to labels; add a mapping dict if needed)
    private var dietLabels: [String] {
        let allDiets = DietSelectionView().dietOptions  // Access static options for labels
        return Array(preferences.selectedDiets.compactMap { id in
            allDiets.first { $0.id == id }?.label
        })
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                header
                summaryCard
                startCookingButton
            }
            .padding()
        }
        .background(Color.primaryBackground)
        .navigationDestination(item: $routeSelection) { route in
            switch route {
            case .login:
                LogInView()
            }
        }
        .onAppear {
            print("FinalPreferencesView loaded: Diets = \(dietLabels), Allergies = \(preferences.selectedAllergies), Time = \(preferences.cookingTimeDisplay), Servings = \(preferences.servingsDisplay)")  // Debug: Should now show real data!
        }
    }
    
    private var header: some View {
        VStack(spacing: 10) {
            Image(systemName: "sparkles")
                .font(.system(size: 40, weight: .semibold))
                .foregroundStyle(Color.accent)
                .padding()
                .background(Color.secondaryAccent)
                .clipShape(Circle())
            
            Text("You're all set!")
                .font(.custom("Montserrat-Bold", size: 28))
                .foregroundStyle(Color.mainText)
            
            Text("plaite is ready to create personalized meal plans just for you")
                .font(.custom("Montserrat-Medium", size: 16))
                .foregroundStyle(Color.greenText)
                .multilineTextAlignment(.center)
        }
    }
    
    private var summaryCard: some View {
        VStack(spacing: 16) {
            SummaryRow(
                title: "Diet Preferences",
                value: dietLabels.isEmpty ? "Not specified" : dietLabels.joined(separator: ", ")
            )
            
            SummaryRow(
                title: "Restrictions",
                value: preferences.selectedAllergies.isEmpty ? "None" : preferences.selectedAllergies.joined(separator: ", ")
            )
            
            SummaryRow(
                title: "Cooking Style",
                value: "\(preferences.cookingTimeDisplay) meals, \(preferences.servingsDisplay) servings"
            )
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
    
    private var startCookingButton: some View {
        Button(action: {
            preferences.saveToUserDefaults()  // Save data for later use (e.g., recipe filtering)
            routeSelection = .login
            // TODO: Navigate to main app (e.g., .sheet or dismiss to dashboard)
            // Example: dismissScreen() or NavigationLink to RecipeView
            print("Starting cooking with saved preferences!")  // Debug
        }) {
            Text("Start Cooking")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.buttonFill)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    LinearGradient(
                        colors: [Color.secondaryAccent, Color.accent],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
        }
        .padding(.top)
    }
}

struct SummaryRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color.secondaryAccent)
                    .frame(width: 20, height: 20)
                
                Image(systemName: "checkmark")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.accent)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("Montserrat-Semibold", size: 14))
                    .foregroundStyle(.mainText)
                
                Text(value)
                    .font(.custom("Montserrat-Medium", size: 10))
                    .foregroundColor(.greenText)
            }
            Spacer()
        }
    }
}

#Preview {
    FinalPreferencesView()
        .environmentObject({
            let prefs = UserPreferences()
            prefs.selectedDiets = ["vegan", "keto"]  // Mock for preview
            prefs.selectedAllergies = ["Peanuts", "Dairy"]
            prefs.selectedCookingTime = "<30 min"
            prefs.selectedServings = "1 - 2 people"
            return prefs
        }())
}
