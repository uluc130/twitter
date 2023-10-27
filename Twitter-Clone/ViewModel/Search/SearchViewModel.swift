//
//  SearchViewModel.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 25.10.2023.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    
    func fetchUsers(){
        AuthServices.requestDomain = "http://localhost:3000/users"
        AuthServices.fetchUser { result in
            switch result {
                case .success(let data):
                
                do{
                    let result = try JSONDecoder().decode([User].self, from: data!)
                    self.users = result
                }
                catch let error{
                    print(error.localizedDescription)
                }
                
                    
                        
                        
                        
                        
                       
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
            }
        }
        
    }
    
    func filterUsers(_ query: String)-> [User] {
        let lowercaseQuery = query.lowercased()
        return users.filter({$0.name.lowercased().contains(lowercaseQuery) || $0.username.lowercased().contains(lowercaseQuery) })
    }
    
}
