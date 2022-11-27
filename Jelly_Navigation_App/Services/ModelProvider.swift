//
//  ModelProvider.swift
//  Jelly_Navigation_App
//
//  Created by Karolina Lisowska on 11/27/22.
//

import Foundation

class ModelProvider : ObservableObject {
    private var serviceProvider : ServiceProvider = ServiceProvider()
    
    static private var inst_ : ModelProvider? = nil
    static func inst() -> ModelProvider {
        if (ModelProvider.inst_ == nil) {
            ModelProvider.inst_ = ModelProvider()
        }
        return ModelProvider.inst_!
    }
    
    lazy var navigationModel = NavigationModel(navigationService: self.serviceProvider.navigationService)
}
