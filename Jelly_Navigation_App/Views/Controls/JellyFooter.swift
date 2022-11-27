//
//  JellyFooter.swift
//  Jelly_Navigation_App
//
//  Created by Karolina Lisowska on 11/27/22.
//

import SwiftUI

struct JellyFooterView: View {
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center){
            VStack(alignment: HorizontalAlignment.leading, spacing: 10.0){
                Text("JellyTech navigation app")
                    .foregroundColor(ColorUtils.subtitleColor)
                    .font(.footnote)
            }
            .padding()
            Spacer()
            VStack(alignment: HorizontalAlignment.trailing, spacing: 10.0){
                Image("jellytech-icon")
                    .resizable()
                    .frame(width: 50.0, height: 35.0)
            }
            .padding()
        }
    }
    
}


struct JellyFooterView_Previews: PreviewProvider {
    static var previews: some View {
        JellyFooterView()
    }
}
