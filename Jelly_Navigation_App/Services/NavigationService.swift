//
//  NavigationService.swift
//  Jelly_Navigation_App
//
//  Created by Karolina Lisowska on 11/27/22.
//

import Foundation

class NavigationService : ObservableObject {
    private let defaults = UserDefaults.standard
    private let urlKey = "navigation_url"
    
    func updateUrl(url: String, _ onSaved: @escaping () -> Void) {
        defaults.set(url, forKey: urlKey)
        print("Updated saved URL to \(defaults.object(forKey: urlKey) as? String ?? "")")
        onSaved()
    }
    
    func getSavedUrl() -> String {
        let savedUrl: String = defaults.object(forKey: urlKey) as? String ?? ""
        print("\(savedUrl == "" ? "No previous URL saved" : "Previous URL found!")")
        return savedUrl
    }
}
