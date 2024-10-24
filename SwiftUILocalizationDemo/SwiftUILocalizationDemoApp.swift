//
//  SwiftUILocalizationDemoApp.swift
//  SwiftUILocalizationDemo
//
//  Created by mohamed ramadan on 24/10/2024.
//

import SwiftUI

@main
struct SwiftUILocalizationDemoApp: App {
    
    private var language = LocalizationService.shared.language
    @ObservedObject var appState = AppState.shared
    
    init() {
        appState.isRTL = language == .english_us ? false : true
    }
    var body: some Scene {
        WindowGroup {
            LoginView().id(appState.isRTL)
                .environment(\.layoutDirection, appState.isRTL ? .rightToLeft : .leftToRight)
        }
    }
}
