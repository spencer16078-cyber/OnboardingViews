//
//  AllergySelectionView.swift
//  OnboardingViews
//
//  Created by Spencer Searle on 10/6/25.
//

import SwiftUI

struct Allergy: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct AllergySelectionView: View {
    @EnvironmentObject var preferences: UserPreferences  // Inject shared model
    @State private var customAllergy: String = ""  // Keep local for UI, but update shared on add
    @Environment(\.dismiss) var dismissScreen
    
    let commonAllergies = [
        "Peanuts", "Tree Nuts", "Dairy", "Eggs", "Soy",
        "Wheat", "Fish", "Shellfish", "Sesame"
    ]
    
    // Computed for UI (matches shared state)
    private var selectedAllergies: [String] {
        preferences.selectedAllergies
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header (unchanged)
                VStack(spacing: 12) {
                    Image(systemName: "exclamationmark.circle")
                        .font(.system(size: 32))
                        .foregroundColor(.orange)
                        .padding(12)
                        .background(Color.orange.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text("Any allergies or restrictions?")
                        .font(.custom("Montserrat-Bold", size: 24))
                    
                    Text("Help us keep you safe with personalized recipes")
                        .font(.custom("Montserrat-Medium", size: 14))
                        .foregroundColor(.greenText)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 20) {
                    // Common Allergies Section (updated to use shared state)
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Common Allergies")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.primary)
                        
                        FlowLayout(spacing: 8) {
                            ForEach(commonAllergies, id: \.self) { allergy in
                                AllergyBadge(
                                    name: allergy,
                                    isSelected: selectedAllergies.contains(allergy)
                                ) {
                                    toggleAllergy(allergy)
                                }
                            }
                        }
                    }
                    
                    // Custom Restriction Section (unchanged, but add updates shared state)
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Add Custom Restriction")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.mainText)
                        
                        HStack(spacing: 8) {
                            TextField("e.g., Cilantro, Mushrooms...", text:$customAllergy)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button {
                                addCustomAllergy()
                            } label: {
                                Text("Add")
                                    .font(.custom("Montserrat-Regular", size: 16))
                            }
                            .buttonStyle(.bordered)
                            .disabled(customAllergy.trimmingCharacters(in: .whitespaces).isEmpty)
                        }
                    }
                    
                    // Your Restrictions Section (updated to use shared state)
                    if !selectedAllergies.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Your Restrictions")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(.mainText)
                            
                            FlowLayout(spacing: 8) {
                                ForEach(selectedAllergies, id: \.self) { allergyName in  // Use names as IDs
                                    HStack(spacing: 4) {
                                        Text(allergyName)
                                            .font(.custom("Montserrat-Medium", size: 12))
                                        
                                        Button {
                                            removeAllergy(allergyName)
                                        } label: {
                                            Image(systemName: "xmark")
                                                .font(.caption2)
                                        }
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(20)
                                }
                            }
                        }
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Navigation Buttons (add disable if empty)
                HStack(spacing: 12) {
                    Button {
                        dismissScreen()
                    } label: {
                        Text("Back")
                            .font(.custom("Montserrat-Medium", size: 16))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.buttonFill)
                            .foregroundColor(.greenText)
                            .cornerRadius(12)
                    }
                    
                    NavigationLink {
                        CookingPreferencesView()
                    } label: {
                        Text("Continue")
                            .font(.custom("Montserrat-Semibold", size: 16))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [.secondaryAccent, .accent], startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .onAppear {
                print("AllergySelectionView loaded: Current selectedAllergies = \(preferences.selectedAllergies)")  // Debug
            }
        }
        .background(Color(.primaryBackground))
    }

    private func toggleAllergy(_ name: String) {
        if selectedAllergies.contains(name) {
            preferences.selectedAllergies.removeAll { $0 == name }
        } else {
            preferences.selectedAllergies.append(name)
        }
        print("Allergy toggled: \(name), Now selected: \(preferences.selectedAllergies)")  // Debug
    }
    
    private func addCustomAllergy() {
        let trimmed = customAllergy.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty,
              !selectedAllergies.contains(trimmed) else { return }
        
        preferences.selectedAllergies.append(trimmed)  // Update shared
        customAllergy = ""
        print("Custom allergy added: \(trimmed)")  // Debug
    }
    
    private func removeAllergy(_ allergyName: String) {
        preferences.selectedAllergies.removeAll { $0 == allergyName }
        print("Allergy removed: \(allergyName)")  // Debug
    }
}

struct AllergyBadge: View {
    let name: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Text(name)
                if isSelected {
                    Text("✓")
                }
            }
            .font(.caption)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? Color.accent : Color.clear)
            .foregroundColor(isSelected ? .white : .mainText)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.clear : Color.stroke, lineWidth: 1)
            )
        }
    }
}

// FlowLayout helper (unchanged)
struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(
            in: proposal.replacingUnspecifiedDimensions().width,
            subviews: subviews,
            spacing: spacing
        )
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(
            in: bounds.width,
            subviews: subviews,
            spacing: spacing
        )
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.frames[index].minX,
                                     y: bounds.minY + result.frames[index].minY),
                         proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var frames: [CGRect] = []
        var size: CGSize = .zero
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if currentX + size.width > maxWidth && currentX > 0 {
                    currentX = 0
                    currentY += lineHeight + spacing
                    lineHeight = 0
                }
                
                frames.append(CGRect(x: currentX, y: currentY, width: size.width, height: size.height))
                lineHeight = max(lineHeight, size.height)
                currentX += size.width + spacing
            }
            
            self.size = CGSize(width: maxWidth, height: currentY + lineHeight)
        }
    }
}

#Preview {
    AllergySelectionView()
        .environmentObject(UserPreferences())  // For preview
}
