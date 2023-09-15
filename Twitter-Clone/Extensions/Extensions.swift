//
//  Extensions.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 25.09.2023.
//

import Foundation
import SwiftUI

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}


struct WelcomeButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(Color.black, lineWidth: 1)
                    .opacity(0.3)
                    .frame(width: 320, height: 60, alignment: .center)
            )
            
    }
}
