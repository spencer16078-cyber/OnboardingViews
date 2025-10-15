//
//  LaunchScreenView.swift
//  OnboardingViews
//
//  Created by Spencer Searle on 10/2/25.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center) {
                    Spacer()
                    
                    Text("plaite")
                        .font(.custom("Montserrat-Bold" ,size: 50))
                        .foregroundStyle(.secondaryText)
                        .padding(5)
                    
                    Text("Your AI-powered meal planning companion")
                        .font(.custom("Montserrat-Medium" ,size: 15))
                        .padding(.horizontal)
                        .foregroundStyle(.greenText)
                    
                    Image("InitialPhoto")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .scaledToFit()
                        .padding(.horizontal, 30)
                        .padding(.vertical)
                    
                    Text("Personalized recipes curated for your diet, allergies, and lifestyle")
                        .font(.custom("Montserrat-Regular" ,size: 15))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .foregroundStyle(.secondaryText)
                    
                    VStack(alignment: .leading) {
                        Text("New User")
                            .font(.custom("Montserrat-Regular", size: 14))
                            .foregroundStyle(.greenText)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 5)
                        
                        NavigationLink {
                            DietSelectionView()
                        } label: {
                            Text("Get Started")
                                .font(.custom("Montserrat-SemiBold" ,size: 15))
                                .foregroundStyle(.buttonFill)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(LinearGradient(colors: [.secondaryAccent, .accent], startPoint: .leading, endPoint: .trailing))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom, 5)
                        }
                        .padding(.horizontal, 30)
                        
                        Text("Already have an account?")
                            .font(.custom("Montserrat-Regular", size: 14))
                            .foregroundStyle(.greenText)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 5)
                        
                        NavigationLink {
                            LogInView()
                        } label: {
                            Text("Login")
                                .font(.custom("Montserrat-SemiBold" ,size: 15))
                                .foregroundStyle(.accent)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.horizontal, 30)
                    }
                    
                    Spacer()
                }
            }
            .background(Color.primaryBackground)
        }
    }
}

#Preview {
    LaunchScreenView()
}
