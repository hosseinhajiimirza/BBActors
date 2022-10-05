//
//  NetworkManager.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/5/22.
//

import Foundation

protocol NetworkManagerDelegate {
    func handleRequestWithPath<T: Codable>(_ path: Paths, completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkManagerDelegate {
    public func handleRequestWithPath<T: Codable>(_ path: Paths, completion: @escaping (Result<T, Error>) -> Void) {
        let baseURL = "https://breakingbadapi.com/api/"
        let urlStr = baseURL + path.rawValue
        guard let url = URL(string: urlStr) else { return }
        
        print("Send to url: \(url)")
        // creating a task:
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                
                return
            }
            // data optional binding and handling:
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    // handling data:
                    completion(.success(model))
                    // to see the respone:
                    print(model)
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }
    
        task.resume()
    }
}

class NetworkManager: NetworkManagerDelegate { }
