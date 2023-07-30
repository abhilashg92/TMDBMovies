//
//  NetworkService.swift
//  TMDB Movies
//
//  Created by Kiwi on 30/07/23.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    
    func callDataTask(request: URLRequest,
                      handler: @escaping (Result<Data, MError>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                handler(.failure(MError.parsingError))
                return
            }
            
            guard let responseData = data else {
                handler(.failure(MError.unexpectedError))
                return
            }
            
            handler(.success(responseData))
        }.resume()
    }
}
