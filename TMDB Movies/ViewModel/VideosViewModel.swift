//
//  VideosViewModel.swift
//  TMDB Movies
//
//  Created by Kiwi on 29/07/23.
//

import Foundation

protocol VideosViewModelProtocol: ObservableObject {
    func fetchMovies()
}

class VideosViewModel: VideosViewModelProtocol {
    
    @Published var searchText = ""
    @Published var movies: [Movie] = []
    
    private let netWorkService: NetworkServiceProtocol
    
    init(netWorkService: NetworkServiceProtocol) {
        self.netWorkService = netWorkService
    }
    
    func fetchMovies() {
        let useCase = SearchMoviesUseCase(netWorkSerive: netWorkService)
        useCase.searchMovies(searchText: searchText) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.movies = movies.results ?? []
                    break
                case .failure(_):
                    self.movies.removeAll()
                }
            }
        }
    }
    
}

