//
//  ImageUploader.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 14.10.2023.
//

import SwiftUI

struct ImageUploader{
    
    static func uploadImage(paramName: String, fileName: String, image: UIImage, urlPath: String){
        let url = URL(string: "http://localhost:3000\(urlPath)")!
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Authorization Header
        let token = UserDefaults.standard.string(forKey: "usertoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send a POST request to the URL, with the data we created earlier
        let session = URLSession.shared
        
       let task = session.uploadTask(with: request, from: data) {responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .fragmentsAllowed)
                
                if let json = jsonData as? [String:Any]{
                    print(json)
                }
            }
        }
        task.resume()
    }
}

