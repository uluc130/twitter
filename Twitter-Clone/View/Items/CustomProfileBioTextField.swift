//
//  CustomProfileBioTextField.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.10.2023.
//

import SwiftUI

struct CustomProfileBioTextField: View {
    @Binding var bio: String
    var body: some View {
        
        VStack {
            ZStack(alignment: .top){
                TextEditor(text: $bio)
                    .foregroundColor(.blue)
                
                
                if bio.isEmpty {
                    HStack {
                            
                            Text("Add a bio to your profile")
                                    .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    .padding(.leading, 4)
                    .padding(.top, 8)
                    .zIndex(1)
                }
                
            }
            
        }
        .frame(height: 90)
        
    }
}

//struct CustomProfileBioTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomProfileBioTextField()
//    }
//}
