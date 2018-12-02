//
//  APIClientProtocol.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 01/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class DogAPIClient {
    
    static let shared = DogAPIClient()
    
    private let baseEndpointUrl = "https://api-iddog.idwall.co/"
    
    private let session = URLSession()
    
    private init() {}
    
    public func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        
        self.session.dataTask(with: self.request(for: request), completionHandler: { (data, response, error) in
            if let data = data {
                
                if let expectedResponse = try? JSONDecoder().decode(T.Response.self, from: data) {
                    completion(.success(expectedResponse))
                } else if let serverError = try? JSONDecoder().decode(ServerError.self, from: data) {
                    completion(.failure(DogError.server(message: serverError.message)))
                } else {
                    completion(.failure(DogError.decoding))
                }
                
            } else if let error = error {
                completion(.failure(error))
            }
            
            
            
        }).resume()
    }
    
    private func request<T: APIRequest>(for request: T) -> URLRequest {
        var stringURL = self.baseEndpointUrl + "/" + request.path
        
        if let params = request.params {
            for (key, value) in params {
                stringURL.append(contentsOf: "?"+key+"="+value)
            }
        }
        
        guard let url = URL(string: stringURL) else {
            fatalError("Bad request path: "+stringURL)
        }
        
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.httpMethod = request.type.rawValue
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("no-cache", forHTTPHeaderField: "Cache-control")
        
        let jsonData = try? JSONEncoder().encode(request)
        urlRequest.httpBody = jsonData

        
        return urlRequest as URLRequest
    }
    
    struct ServerError: Decodable {
        let message: String
    }
        
}
