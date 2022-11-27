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
    @State private var showBrowser: Bool = false
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(alignment: .center, spacing: 20.0){
            Spacer()
            VStack(alignment: .center) {
                Text("Please enter URL:")
                    .bold()
                TextField("Navigate to...", text: self.$model.url)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()

            HStack(alignment: VerticalAlignment.center, spacing: 10.0){
                Button("Navigate") {
                    print("Go to URL \(self.model.url)")
                    self.model.saveURL {
                        print("URL \(self.model.url) valid. Opening in browser...")
                        openURL(self.model.prepareURL()!)
                    }
                }
                .buttonStyle(ActionButtonStyle())
                
                Button("Navigate in app") {
                    print("Go to URL \(self.model.url)")
                    self.model.saveURL {
                        print("URL \(self.model.url) valid. Opening in browser...")
                        self.showBrowser.toggle()
                    }
                }
                .buttonStyle(ActionButtonStyle())
            }
            
            Spacer()
            JellyFooterView()
        }
        .fullScreenCover(isPresented: $showBrowser, content: {
            SFSafariViewWrapper(url: self.model.prepareURL()!)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
