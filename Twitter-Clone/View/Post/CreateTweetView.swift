//
//  CreateTweetView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 17.09.2023.
//

import SwiftUI
import PhotosUI


struct CreateTweetView: View {
    
    @ObservedObject var viewModel = CreateTweetViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var text = ""
    @State private var showImagePicker = false
    @State private var selectedImage: PhotosPickerItem?
    @State private var image: Image?
    @State private var uiImage: UIImage?
    
    @State private var selectedPhotoData: Data?
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .padding()
                }
                
                Spacer()
                Button {
                    if text != ""{
                        self.viewModel.uploadPost(text: text, image: uiImage)
                        dismiss()
                    }
                } label: {
                    Text("Tweet")
                        .padding()
                }
                .background(Color("bg"))
                .foregroundColor(.white)
                .clipShape(Capsule())

            }
            
               MultiLineTextField(text: $text)
            
            
            if let selectedPhotoData, let img = UIImage(data: selectedPhotoData){
                
                VStack {
                    HStack (alignment: .top) {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                            .cornerRadius(16)
                            .clipped()
                    }
                    Spacer()
                }.onAppear {
                    uiImage = img
                }
            }else{
                PhotosPicker(selection: $selectedImage){
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .padding(.top)
                        .foregroundColor(.black)
                    
                }
                .onChange(of: selectedImage) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedPhotoData = data
                        }
                    }
                }
            }
            

            
        }.padding()
            
        
//        if let selectedPhotoData, let img = UIImage(data: selectedPhotoData){
            
//        }
        
    }
}
//
//struct CreateTweetView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTweetView()
//    }
//}
