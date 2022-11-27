//
//  NavigationModel.swift
//  Jelly_Navigation_App
//
//  Created by Karolina Lisowska on 11/27/22.
//

import Foundation

class NavigationModel : ObservableObject {
    private var navigationService : NavigationService
    
    @Published var url : String = "";

    init(navigationService : NavigationService) {
        self.navigationService = navigationService
        
        self.url = self.navigationService.getSavedUrl()
    }
    
    func saveURL(_ handler: @escaping () -> Void){
        guard prepareURL() != nil else {
            return
        }
        
        self.navigationService.updateUrl(url: self.url) {
            handler()
        }
    }
    
    func prepareURL() -> URL?{
        guard let url = URL(string: self.url),
              var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            print("Navigation URL \(self.url) isn't valid!. Resetting value...")
            self.url = ""
            return nil
        }

        // Scheme is required for openURL to work properly - so if user doesn't provide it, add HTTPS automatically
        if (components.scheme == nil) {
            components.scheme = "https";
        }
        
        return components.url
    }
}
