//
//  BlurView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 21.09.2023.
//

import SwiftUI

struct BlurView: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
