//
//  AuthViewModel.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 9.10.2023.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?
    
    init(){
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: "usertoken")
        
//        logout()
        if (token != nil) {
            isAuthenticated = true
            if let userId = defaults.object(forKey: "userid"){
                fetchUser(userId: userId as! String)
                
            }
        }
        else{
           isAuthenticated = false
        }
        
    }
    static let shared = AuthViewModel()
    
    func login(email: String, password: String){
        
        let defaults = UserDefaults.standard
        
        
        AuthServices.login(email: email, password: password) { result in
            switch result {
                case .success(let data):
                    if let user = try? JSONDecoder().decode(ApiResponse.self, from: data!){
                        DispatchQueue.main.async {
                            defaults.set(user.token, forKey: "usertoken")
                            
                            defaults.set(user.user.id, forKey: "userid")
                            
                            self.currentUser = user.user
                            self.isAuthenticated = true
                            print("logged in")
                        }
                    }else{
                        print("no data")
                        return
                    }
                        
                        
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func register(email: String, name: String, password: String, username: String){
        AuthServices.register(email: email, name: name, password: password, username: username) { result in
            switch result {
                case .success(let data):
                    guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data!) else {return}
                    print(user)
            case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func fetchUser(userId: String){
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        AuthServices.fetchUser() { result in
            switch result {
                case .success(let data):
                    guard let user = try? JSONDecoder().decode(User.self, from: data!) else {return}
                    DispatchQueue.main.async {
                        UserDefaults.standard.setValue(user.id, forKey: "userid")
                        self.currentUser = user
                        self.isAuthenticated = true
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
            }
        }
        
    }
    
    func logout(){
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        
        DispatchQueue.main.async {
            self.isAuthenticated = false
            
        }
    }
    
}
