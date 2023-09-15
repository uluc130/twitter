//
//  SearchUserCell.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI

struct SearchUserCell: View {
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Uluc Hosgelen")
                    .fontWeight(.bold)
                Text("@uluchosgelen")
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
        }
    }
}

struct SearchUserCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserCell()
    }
}
