//
//  LogInView.swift
//  OnboardingViews
//
//  Created by Spencer Searle on 10/8/25.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        VStack {
            Spacer()
            // app logo & text
            Image("Logo")
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
                .padding(.bottom)
            
            Text("Your personalized meal planning assistant")
                .font(.custom("Montserrat-Medium", size: 16))
                .foregroundStyle(Color.accent)
                .multilineTextAlignment(.center)
                              
            Button {
                // navigate to sign up screen in real app
                print("Successfully navigated to sign up screen")
            } label: {
                Text("Sign Up")
                    .font(.custom("Montserrat-Semibold", size: 20))
                    .foregroundStyle(Color.buttonFill)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(colors: [.accent, .secondaryAccent], startPoint: .trailing, endPoint: .leading))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.top, 50)
            
            Button {
                // navigate to log in screen in real app
                print("Successfully navigated to log in screen")
            } label: {
                Text("Log In")
                    .font(.custom("Montserrat-Semibold", size: 20))
                    .foregroundStyle(Color.greenText)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.bottom, 50)
            
            // terms and policies
            Text("By continuing, you agree to our Terms of Service and Privacy Policy")
                .font(.custom("Montserrat-Medium", fixedSize: 12))
                .foregroundStyle(Color.greenText)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
        .background(Color.primaryBackground)
    }
}

#Preview {
    LogInView()
}
