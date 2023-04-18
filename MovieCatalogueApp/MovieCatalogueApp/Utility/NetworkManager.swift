//
//  NetworkManager.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 13/04/23.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate {
    func performRequest<T: Codable>(serviceType:NetworkAPI, completionHandler: @escaping(ApiResponse<T>)->())
}


final class NetworkManager: NetworkManagerDelegate { 
    
    static let shared = NetworkManager()
    private init() { }
    
   
    func performRequest<T>(serviceType: NetworkAPI, completionHandler: @escaping (ApiResponse<T>) -> ()) where T : Decodable, T : Encodable {
       
        Alamofire.request(serviceType.path, method: .get, encoding: URLEncoding.default, headers: nil).responseData { response in
            switch response.result {
            case .success(let value):
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: value)
                    completionHandler(.success(value: model))
                } catch let error {
                    completionHandler(.failure(error: error))
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(.failure(error: error))
            }
        }
         
    }
}
