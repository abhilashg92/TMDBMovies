//
//  MoviesModel.swift
//  TMDB Movies
//
//  Created by Kiwi on 29/07/23.
//

import Foundation

struct MovieUIModel: Identifiable {
    let id: Int?
    let title: String?
    let thumbnail: String?
    let overview: String?
}

struct MovieData: Codable {
    let results: [Movie]?
}

struct Movie: Codable,Identifiable {
    let adult: Bool?
    let backdrop_path: String?
    let id: Int?
    let genre_ids : [Int]?
    let original_title, overview: String?
    let popularity: Double?
    let poster_path, release_date, title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    
    func getThumbnailUrl() -> String {
        return APIUrl.thumbnailBase + (poster_path ?? "")
    }
}

struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}
