//
//  RegisterView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 26.09.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var adress = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                ZStack{
                    Image("Twitter")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 20, height: 20)
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        Spacer()
                    }
                    
                }.padding(.horizontal)
                
                
                
                VStack(alignment: .leading, spacing: 5) {
                        
                    CustomAuthTextView(placeholder: "Name", text: $name)
                        
                    
                    CustomAuthTextView(placeholder: "Phone number or email", text: $adress)
                        
                    SecureAuthTextField(placeholder: "Password", text: $password)
                        
 
                }.padding(.horizontal, 30)
                    .padding(.top)
                
                Spacer()
                Divider()
                HStack {
                    Spacer()
                    Button {
                        viewModel.register(email: adress, name: name, password: password, username: name)
                    } label: {
                        Text("Next")
                            .padding(3)
                            .frame(width: 60, height: 35)
                            .foregroundColor(.white)
                            .background(Color("bg"))
                           
                        
                        
                }.clipShape(Capsule())
                }
                .padding(.horizontal, 30)
                    .padding(.bottom)

            }.toolbar(.hidden)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
