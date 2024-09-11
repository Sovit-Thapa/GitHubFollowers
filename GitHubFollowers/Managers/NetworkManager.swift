//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-07.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com"
    
    private init(){}
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>)-> Void){
            let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
            
            guard let url = URL(string: endpoint) else{
                completed(.failure(.invalidUsername))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let _ = error{
                    completed(.failure(.unableToComplete))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                    completed(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else{
                    completed(.failure(.invalidData))
                    return
                }
                
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let followers = try decoder.decode([Follower].self, from: data)
                    completed(.success(followers))
                } catch{
                        completed(.failure(.invalidData))
                }
            }
            
            task.resume()
    }
}
