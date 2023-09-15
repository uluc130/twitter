//
//  SecureAuthTextField.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 26.09.2023.
//

import SwiftUI

struct SecureAuthTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
                if !text.isEmpty{
                    withAnimation {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .font(.caption)
                            .offset(y: -20)
                    }
                }
                SecureField(placeholder, text: $text)
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

//struct SecureAuthTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        SecureAuthTextField()
//    }
//}
