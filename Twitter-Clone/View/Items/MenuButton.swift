//
//  MenuButton.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 19.09.2023.
//

import SwiftUI

struct MenuButton: View {
    var title: String
    var body: some View {

        HStack {
            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 25, height: 25)
            Text(title)
                Spacer(minLength: 0)
        }
        .padding(.vertical, 12)
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(title: "Messages")
    }
}
