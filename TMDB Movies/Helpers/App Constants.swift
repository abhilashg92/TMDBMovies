//
//  App Constants.swift
//  TMDB Movies
//
//  Created by Kiwi on 30/07/23.
//

import Foundation

struct AppConstants {
    static let apiKey = "c04cd6b4dd3fc9599bfd3edc85994b2b"
}

struct Strings {
    static let moviesTitle = "Movies"
    static let searchMovies = "Search Movies"
}

struct APIUrl {
    static let baseUrl = "https://api.themoviedb.org/3"
    static let movie = "/movie"
    static let search = "/search"
    static let prarmeterQuery = "&query="
    static let apiKey = "?api_key="
    static let thumbnailBase = "https://image.tmdb.org/t/p/w500"
    
    func getSearchMovieUrl() -> String {
        return APIUrl.baseUrl + APIUrl.search + APIUrl.movie + APIUrl.apiKey + AppConstants.apiKey + APIUrl.prarmeterQuery
    }

}
