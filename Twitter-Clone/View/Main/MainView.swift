//
//  MainView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI

struct MainView: View {
    let user: User
    @State private var width = UIScreen.main.bounds.width - 90
    @State private var x = -UIScreen.main.bounds.width + 90
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    VStack {
                        TopBar(x: $x)
                        Home(user: user)
                    }
                    .offset(x: x + width)
                    SlideMenu()
                        .shadow(color: Color.black.opacity(x != 0 ? 0.4: 0), radius: 5, x: 5, y: 0)
                        .offset(x: x)
                        .background(Color.black.opacity(x == 0 ? 0.5: 0))
                        .ignoresSafeArea(.all, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                x = -width
                            }
                        }
                }
                .gesture(DragGesture().onChanged({ (value) in
                    withAnimation {
                        if value.translation.width > 0{
                            if x < 0 {
                                x = -width + value.translation.width
                            }
                        }else{
                            if x != -width {
                                x = value.translation.width
                            }
                        }
                    }
                }).onEnded({ (value) in
                    withAnimation {
                        if value.translation.width < (width/2){
                            x = -width
                        }else{
                            x = 0
                        }
                    }
                    
                }))
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
        
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
