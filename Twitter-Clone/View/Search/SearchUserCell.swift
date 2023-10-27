//
//  SearchUserCell.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI
import Kingfisher

struct SearchUserCell: View {
    let user: User
    var body: some View {
        HStack{
            KFImage(URL(string: "http://localhost:3000/users/\(user.id)/avatar"))
                .placeholder({
                    Image("Profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                })
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(user.name)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text("@\(user.username)")
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
        }
    }
}

//struct SearchUserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchUserCell()
//    }
//}
