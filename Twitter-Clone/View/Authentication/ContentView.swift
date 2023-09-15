//
//  ContentView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 15.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if viewModel.isAuthenticated {
            
           if let user = viewModel.currentUser{
                MainView(user: user)
              
            }
            
        }else{
            WelcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
