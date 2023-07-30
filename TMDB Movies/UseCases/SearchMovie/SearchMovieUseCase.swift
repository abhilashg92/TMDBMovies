//
//  SearchMovieUseCase.swift
//  TMDB Movies
//
//  Created by Kiwi on 30/07/23.
//

import Foundation

protocol SearchMoviesUseCaseProtocol {
    func searchMovies(searchText: String,
                      handler: @escaping (Result<MovieData, MError>) -> Void)
}

final class SearchMoviesUseCase: SearchMoviesUseCaseProtocol {
    
    let netWorkSerive: NetworkServiceProtocol
    init(netWorkSerive: NetworkServiceProtocol) {
        self.netWorkSerive = netWorkSerive
    }
    
    func searchMovies(searchText: String,
                      handler: @escaping (Result<MovieData, MError>) -> Void) {
        
        guard let url = URL(string: APIUrl().getSearchMovieUrl() + searchText ) else {
            return
        }
        
        let req =  URLRequest(url: url)
        
        netWorkSerive.callDataTask(request: req) { result in
            switch result {
            case .success(let moviesData):
                do {
                    let data = try JSONDecoder().decode(MovieData.self, from: moviesData)
                    handler(.success(data))
                } catch {
                    print(error.localizedDescription)
                    handler(.failure(MError.unexpectedError))
                }
                break
            case .failure(let err):
                handler(.failure(err))
                break
                
            }
            
        }
    }
}
