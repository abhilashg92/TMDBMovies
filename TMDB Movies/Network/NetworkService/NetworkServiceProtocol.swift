//
//  NetworkProtocol.swift
//  TMDB Movies
//
//  Created by Kiwi on 30/07/23.
//

import Foundation

enum MError: Error {
    case parsingError
    case unexpectedError
}

protocol NetworkServiceProtocol {
    func callDataTask(request: URLRequest,
                      handler: @escaping  (Result<Data, MError>) -> Void)
}
