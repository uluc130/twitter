//
//  TopBar.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI

struct TopBar: View {
    
    @Binding var x: CGFloat
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Button {
                    withAnimation {
                        x = 0
                    }
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 24))
                        .foregroundColor(Color("bg"))
                }
                Spacer(minLength: 0)
                Image("Twitter")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20, height: 20)
                Spacer(minLength: 0)
            }
            .padding()
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            
        }.background(Color.white)
    }
}

//struct TopBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TopBar(showMenu: true)
//    }
//}
