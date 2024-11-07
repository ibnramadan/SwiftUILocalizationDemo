//
//  LoginView.swift
//  SwiftUILocalizationDemo
//
//  Created by mohamed ramadan on 24/10/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isRTL = AppState.shared.isRTL // Bind to the app-wide RTL state
    
    var body: some View {
        NavigationStack {
            List {
                // Greeting Text
                Text("Hello World!".localized())
                    .font(.title)
                    .padding()
                    .transition(.opacity)
                
                // Gender Menu
                Menu("Gender".localized()) {
                    Button("Male".localized()) {}
                    Button("Female".localized()) {}
                }
                .padding()
                .transition(.slide)
                
                // Text Fields for Email and Password
                VStack {
                    TextField(text: $email) {
                        Text("Email".localized())
                    }
                    
                    SecureField(text: $password) {
                        Text("Password".localized())
                    }
                }
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                
                // Login Button
                Button {
                    // Perform login action
                } label: {
                    Text("Login".localized())
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                
                // Change Language Button with Animation
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        toggleLanguage()
                    }
                }, label: {
                    Text("Language".localized())
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                })
                .padding(.top, 20)
                
            }
            .padding()
            .environment(\.layoutDirection, isRTL ? .rightToLeft : .leftToRight)
            .onAppear {
                isRTL = AppState.shared.isRTL // Ensure the correct direction on load
            }
        }
    }
    
    // Function to toggle the language and layout direction
    private func toggleLanguage() {
        if isRTL {
            LocalizationService.shared.language = .english_us
            AppState.shared.isRTL = false
        } else {
            LocalizationService.shared.language = .arabic
            AppState.shared.isRTL = true
        }
        isRTL = AppState.shared.isRTL // Update local state
    }
}

// Preview
#Preview {
    LoginView()
}
