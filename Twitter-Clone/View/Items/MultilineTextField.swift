//
//  MultilineTextField.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 17.09.2023.
//

import SwiftUI

struct MultiLineTextField: UIViewRepresentable{
    func makeCoordinator() -> Coordinator {
        return MultiLineTextField.Coordinator(parent1: self)
    }
    
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> some UIView {
        let text = UITextView()
        text.isEditable = true
        text.text = "Type something"
        text.isUserInteractionEnabled = true
        text.textColor = .gray
        text.font = .systemFont(ofSize: 20)
        text.delegate = context.coordinator
       
        return text
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
    class Coordinator: NSObject, UITextViewDelegate{
        var parent: MultiLineTextField
        
        init(parent1: MultiLineTextField) {
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
