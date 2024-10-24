//
//  LocalizationService.swift
//  SwiftUILocalizationDemo
//
//  Created by mohamed ramadan on 24/10/2024.
//

import Foundation

class AppState: ObservableObject {
    static let shared = AppState()
    @Published var isRTL = false
}

class LocalizationService {
    
    static let shared = LocalizationService()
    static let changedLanguage = Notification.Name("changedLanguage")
    
    private init() {}
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                
                var languageCode = ""
                languageCode = NSLocale.current.language.languageCode?.identifier ?? ""
                
                if languageCode == Language.arabic.rawValue {
                    
                    UserDefaults.standard.setValue(Language.arabic.rawValue, forKey: "language")
                    
                    return .arabic
                } else {
                    
                    UserDefaults.standard.setValue(Language.english_us.rawValue, forKey: "language")
                    
                    return .english_us
                    
                }
                
            }
            
            return Language(rawValue: languageString) ?? .english_us
            
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                NotificationCenter.default.post(name: LocalizationService.changedLanguage, object: nil)
            }
        }
    }
}

enum Language: String {
    case arabic = "ar"
    case english_us = "en"
    
    var isRTL: Bool {
        self == .arabic
    }
}
