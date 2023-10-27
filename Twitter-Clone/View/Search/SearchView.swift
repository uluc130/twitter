//
//  SearchView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 15.09.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var text = ""
    @State private var isEditing = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var filteredUsers: [User] {
        return text.isEmpty ? viewModel.users : viewModel.filterUsers(text)
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView{
                    SearchBar(searchText: $text, isEditing: $isEditing)
                        .padding(.horizontal)
                        
    //                if !isEditing{
                    LazyVStack {
                        ForEach(filteredUsers) { user in
                            NavigationLink {
                                UserProfile(user: user)
                            } label: {
                                SearchUserCell(user: user)
                                    .padding(.leading)
                            }

                        }
                    }
                }
            }
        }
       
    }
}

