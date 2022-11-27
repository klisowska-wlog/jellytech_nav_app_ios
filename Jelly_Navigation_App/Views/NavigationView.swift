//
//  NavigationView.swift
//  Jelly_Navigation_App
//
//  Created by Karolina Lisowska on 11/20/22.
//

import SwiftUI
import SafariServices

struct NavigationView: View {
    @ObservedObject private var model: NavigationModel = ModelProvider.inst().navigationModel
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Please enter URL:")
                .bold()
            TextField("Navigate to...", text: self.$model.url)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Navigate") {
                print("Go to URL \(self.model.url)")
                self.model.saveURL {
                    print("URL \(self.model.url) valid. Opening in browser...")
                    openURL(self.model.prepareURL()!)
                }
            }
            .contentShape(Rectangle())
            .buttonBorderShape(.roundedRectangle(radius: 12))
            .buttonStyle(.borderedProminent)
            .padding()
        
        }.padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
