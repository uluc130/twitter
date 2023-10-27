//
//  AutServices.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 10.10.2023.
//

import Foundation
import SwiftUI


enum NetworkError: Error{
    case invalidURL
    case noData
    case decodingError
}
enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

public class AuthServices{
    
    public static var requestDomain = ""
    static func fetchUser(completition: @escaping (_ result: Result<Data?, AuthenticationError>)->Void){
        let url = URL(string: requestDomain)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, res, err in
//            guard let err = err else {
//                throw err?.localizedDescription
//
//
//            }
            guard let data = data else {
                
                completition(.failure(.invalidCredentials))
                return}
            
            
            completition(.success(data))
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]{
                   
                }
            }
            catch let err{
                completition(.failure(.invalidCredentials))
                print(err)
            }
            
        }
        task.resume()
        
        
    }
    
    
    static func login(email: String, password: String, completition: @escaping (_ result: Result<Data?, AuthenticationError>)-> Void) {
        let url = URL(string: "http://localhost:3000/users/login")!
        
        makeRequest(url: url, reqBody: ["email": email, "password": password]) { result in
            switch result {
                case .success(let data):
                    completition(.success(data))
                case .failure(let error):
                    completition(.failure(.invalidCredentials))
            }
        }
    }
    
    static func register(email: String, name: String, password: String, username: String, completition: @escaping (_ result: Result<Data?, AuthenticationError> )-> Void){
        let url = URL(string: "http://localhost:3000/users")!
        
        makeRequest(url: url, reqBody: ["email": email, "name": name, "username": username, "password": password]) { result in
            switch result {
            case .success(let data):
                completition(.success(data))
            case .failure(let error):
                completition(.failure(.invalidCredentials))
            }
        }
        
    }
    
    static func makeRequest(url: URL, reqBody: [String: Any], completition: @escaping(_ result: Result<Data?, NetworkError>)-> Void ){
      
        var request = URLRequest(url: url)
        
        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
        }
        catch let error {
            print(error)
        }
       
        
        
        // For POST requests with a JSON body, set the Content-Type header
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completition(.success(data))
            guard error == nil else {
                
                return
            }
            guard let data = data else{
                completition(.failure(.noData))
                return
            }
            
            
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]{
                    
                }
            }
            catch let error {
                completition(.failure(.decodingError))
                print(error)
            }
        }
        task.resume()
    }
    
    static func patchRequest(name: String?, bio: String?, location: String?, website: String?, completion: @escaping (_ result: [String:Any]?)->Void) {
        
        let params = ["name": name, "bio": bio, "location": location, "website": website]
        
        let url = URL(string: "http://localhost:3000/users/me")!
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "PATCH"
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
            if let err = err{
                print(err.localizedDescription)
                return
            }
            guard let data = data else {
                print("no data")
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
        
        
        
    
}
