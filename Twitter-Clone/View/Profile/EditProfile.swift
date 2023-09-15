//
//  EditProfile.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 17.10.2023.
//

import SwiftUI
import Kingfisher
import PhotosUI

struct EditProfile: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: EditProfileViewModel
    @Binding var user: User
    @State private var profileImage: Image?
    @State private var profileImageUI: UIImage?
    
    
    
    @State private var showImagePicker = false
    @State private var selectedImage: PhotosPickerItem?
    
    @State private var name: String
    @State private var location: String
    @State private var bio: String
    @State private var website: String
    
    init(user: Binding<User>) {
        
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._name = State(initialValue: _user.name.wrappedValue)
        self._location = State(initialValue: _user.location.wrappedValue ?? "")
        self._bio = State(initialValue: _user.bio.wrappedValue ?? "")
        self._website = State(initialValue: _user.website.wrappedValue ?? "")
       
    }
   
    

    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button {
                        
                        viewModel.uploadProfile(name: name, bio: bio, website: website, location: location)
                        viewModel.uploadProfileImage(text: "text", image: profileImageUI)
                        KingfisherManager.shared.cache.clearCache()
                        
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundColor(.black)
                    }


                }.padding()
                    Text("Edit Profile")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                

            }
            
            VStack{
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width, height: 180, alignment: .center)
                
                HStack{
                    if profileImage == nil{
                        
                        PhotosPicker(selection: $selectedImage){
                            KFImage(URL(string: "http://localhost:3000/users/\(viewModel.user.id)/avatar"))
                                .resizable()
                                .placeholder({
                                    Image("Profile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                })
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(y:-20)
                        }
                        .onChange(of: selectedImage) { _ in
                                    Task {
                                        if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                                            if let uiImage = UIImage(data: data) {
                                                profileImageUI = uiImage
                                                profileImage = Image(uiImage: uiImage)
                                                return
                                            }
                                        }

                                        print("Failed")
                                    }
                                }
                        

                    }
                    else if let image = profileImage {
                        VStack {
                            HStack(alignment: .top) {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                    .padding(8)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(y:-20)
                                
                            }
                            .padding()
                        }
                        .padding(.leading, 12)
                        
                    }
                    Spacer()
                }
                .onAppear(perform: {
                    KingfisherManager.shared.cache.clearCache()
                })
                .padding(.top, -25)
                .padding(.bottom, -10)
                
                VStack{
                    Divider()
                    HStack {
                        ZStack {
                            HStack{
                                Text("Name")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $name, placeholder: "Add your name")
                                .padding(.leading,90)
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                    HStack {
                        ZStack {
                            HStack{
                                Text("Location")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $location, placeholder: "Add your location")
                                .padding(.leading,90)
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                    HStack{
                        ZStack(alignment: .topLeading){
                            HStack{
                                Text("Bio")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileBioTextField(bio: $bio)
                                .padding(.leading, 86)
                                .padding(.top, -6 )
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    HStack {
                        ZStack {
                            HStack{
                                Text("Website")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $website, placeholder: "Add your website")
                                .padding(.leading,90)
                        }
                    }
                    .padding(.horizontal)
                
                }
                
            }
            .padding(.leading, 12)
            Spacer()
            
        }
        .onReceive(viewModel.$uploadComplete, perform: { complete in
            if complete {
                self.user = viewModel.user
            }
        })
        .toolbar(.hidden)
        
    }
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfile()
//    }
//}
