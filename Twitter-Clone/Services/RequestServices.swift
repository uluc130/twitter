//
//  RequestServices.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 11.10.2023.
//

import Foundation



public class RequestServices {
    
    public static var requestDomain = ""
    public static func postTweet(text: String, user: String, username: String, userId: String, completion: @escaping (_ result: [String:Any]?)-> Void){
        
        let params = ["test": text, "user": user, "username": username, "userID": userId]
        
        let url = URL(string: requestDomain)!
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Acccept")
        
        // Authorization part of the request
        let token = UserDefaults.standard.string(forKey: "usertoken")!
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do{
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch{
            print(error.localizedDescription)
        }
        
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, res, err in
            if let err = err {
                print(err.localizedDescription)
                return}
            guard let data = data else {
                
                return}
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]{
                        completion(json)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    
    static func fetchData(completion: @escaping (_ result: Result<Data?, NetworkError>)-> Void){
        
        let url = URL(string: requestDomain)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, res, err in
                guard err == nil else {
                    completion(.failure(.invalidURL))
                    print("unknown")
                    return
                }
                guard let data = data else {
                    print("no data")
                    completion(.failure(.noData))
                return}
            
            
            completion(.success(data))
            
            
        }
        task.resume()
        
        
    }
    
    static func followingProcess(id: String, completion: @escaping (_ result: Result<Data?, NetworkError>)-> Void) {
        let url = URL(string: requestDomain)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        
        // Authorization part of the request
        let token = UserDefaults.standard.string(forKey: "usertoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, res, err in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            guard let data = data else {
                print("no data")
                return}
            
        }
        task.resume()
        
    
    }
    
    static func likingProcess (completion: @escaping (_ result: [String:Any]? )-> Void) {
        let url = URL(string: requestDomain)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        
        // Authorization part of the request
        let token = UserDefaults.standard.string(forKey: "usertoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, res, err in
            guard let err = err else {return}
            guard let data = data else {return}
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]{
                    completion(json)
                }
            }
            catch let error{
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    public static func sendNotification(username: String, notSenderId: String, notReceiverID: String, postText: String, notificationType: String, completion: @escaping (_ result: [String: Any]?)-> Void) {
        
        var params: [String:Any] {
            return postText.isEmpty ? ["username": username, "notSenderId": notSenderId, "notReceiverID": notReceiverID, "notificationType": notificationType] as [String:Any] :
            ["username": username, "notSenderId": notSenderId, "notReceiverId": notReceiverID, "notificationType": notificationType, "postText": postText] as [String:Any]
        }
        
        let url = URL(string: requestDomain)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Authorization part of the request
        let token = UserDefaults.standard.string(forKey: "usertoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error{
            print(error)
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) {data, res, err in
            guard let err = err else{
                print("qqq")
                return}
            guard let data = data else{
                print("no data")
                return}
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] {
                    completion(json)
                }
            }
            catch let error {
                print(error)
            }
            
        }
        task.resume()
                
    }

}

