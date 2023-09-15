//
//  TabButton.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 21.09.2023.
//

import SwiftUI

struct TabButton: View {
    var title: String
    var animation: Namespace.ID
    
    
    @Binding var currentTab: String
    var body: some View {
        Button {
           currentTab = title
        } label: {
            LazyVStack(spacing:12) {
                Text(title)
                    .foregroundColor(currentTab == title ? .primary : .gray)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                Rectangle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(currentTab == title ? .blue: .clear )
                    .frame(height: 1.2)
//                    .matchedGeometryEffect(id: "TAB", in: animation)
                    
                    
            }
                
              
        }

    }
}

//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButton(title: "Posts")
//    }
//}
