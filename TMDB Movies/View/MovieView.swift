//
//  MovieView.swift
//  TMDB Movies
//
//  Created by Kiwi on 30/07/23.
//

import SwiftUI

struct MovieView: View {
    
    var movie: Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.getThumbnailUrl())) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 150)
            .background(Color.gray)
            
            VStack(alignment: .leading) {
                Text(movie.title ?? "")
                    .font(.headline)
                Text(movie.original_title ?? "")
            }
            .padding(5)
            
        }
    }
}
