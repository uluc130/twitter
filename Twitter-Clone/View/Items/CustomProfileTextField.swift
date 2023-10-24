//
//  CustomProfileTextField.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.10.2023.
//

import SwiftUI

struct CustomProfileTextField: View {
    
    @Binding var message:String
    var placeholder: String
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    if message.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                    } 
                    Spacer()
                }
                TextField("", text: $message)
                    .foregroundColor(.blue)
            }
        }
    }
}

//struct CustomProfileTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomProfileTextField(message: Binding<String>, placeholder: <#T##String#>)
//    }
//}
