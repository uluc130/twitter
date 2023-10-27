//
//  SearchBar.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isEditing: Bool
    @FocusState private var searchIsFocused: Bool
    var body: some View {
    
            HStack {
                
    
                    TextField("Search", text: $searchText)
                        .focused($searchIsFocused)
                        .padding(8)
                        .padding(.horizontal, 24)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .overlay(
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                    
                            }
                        )
                
                Button {
                    searchText = ""
                    isEditing = false
                    searchIsFocused = false
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .padding(.trailing, 8)
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: 2)
                }
                
                
            }
            .onTapGesture {
                isEditing = true
            }
        
        .padding()
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(searchText: "Search")
//    }
//}
