//
//  CustomAuthTextView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 26.09.2023.
//

import SwiftUI

struct CustomAuthTextView: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack{
            ZStack (alignment: .leading){
                if !text.isEmpty{
                    
                    withAnimation {
                        Text(placeholder)
                        .foregroundColor(.gray)
                        .font(.caption)
                        .offset(y: -20)
                    }
                }
                TextField(text: $text){
                    Text(placeholder)
                }
                    .frame( height: 55)
                    .foregroundColor(Color("bg"))
            }
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(.gray)
                .padding(.top, -3)
        }
        .padding(.horizontal)
        
    }
}

//struct CustomAuthTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomAuthTextView(placeholder: "Name", text: text)
//    }
//}
