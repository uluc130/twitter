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
    
    var body: some View {
        VStack{
            SearchBar(searchText: $text, isEditing: $isEditing)
                .padding(.horizontal)
            if !isEditing{
                ForEach(0..<9) { item in
                    SearchCell(tweets: String(item), tag: "Hello")
                }
                
                .listStyle(.grouped)
            } else{
                List(0..<9) { item in
                    SearchUserCell()
                }
                
                .listStyle(.grouped)
            }
        }
       
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
