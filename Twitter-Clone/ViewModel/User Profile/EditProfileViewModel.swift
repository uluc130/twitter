//
//  EditProfileViewModel.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 19.10.2023.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    
    func save(name: String?, bio: String?, website:String?, location: String?) {
        guard let userNewName = name else {return}
        guard let userNewBio = bio else {return}
        guard let userNewWebsite = website else {return}
        guard let userNewLocation = location else {return}
        
        user.name = userNewName
        user.bio = userNewBio
        user.website = userNewWebsite
        user.location = userNewLocation
    }
    
    
    func uploadProfile(name: String?, bio: String?, website:String?, location: String?) {
    
        
        AuthServices.patchRequest(name: name, bio: bio, location: location, website: website) { result in
            DispatchQueue.main.async {
                self.save(name: name, bio: bio, website: website, location: location)
                self.uploadComplete.toggle()
            }
        }
        
        
    }
    
    func uploadProfileImage(text: String, image: UIImage?){
        
        guard AuthViewModel.shared.currentUser != nil else {return}
        let urlPath = "/users/me/avatar"
        if let image = image{
            ImageUploader.uploadImage(paramName: "avatar", fileName: "profile", image: image, urlPath: urlPath)
        }
    }
}
