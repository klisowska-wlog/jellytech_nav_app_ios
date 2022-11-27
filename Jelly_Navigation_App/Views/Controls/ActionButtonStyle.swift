//
//  ActionButtonStyle.swift
//  Jelly_Navigation_App
//
//  Created by Karolina Lisowska on 11/27/22.
//

import Foundation
import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(Font.body.bold())
            .padding(10)
            .padding(.horizontal, 20)
            .background(ColorUtils.defaultButtonBackgroundColor.opacity(
                configuration.isPressed ? 0.5 : 1
            ))
            .cornerRadius(10)
    }
}

struct ActionButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Hello"){
            
        }
            .buttonStyle(ActionButtonStyle())
    }
}
