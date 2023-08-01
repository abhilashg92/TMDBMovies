//
//  MovieView.swift
//  TMDB Movies
//
//  Created by Kiwi on 30/07/23.
//

import SwiftUI

struct MovieView: View {
    
    var movie: MovieUIModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.thumbnail ?? "")) { image in
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
                Text(movie.date ?? "")
            }
            .padding(5)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    let vm = VideosViewModel(netWorkService: NetworkService())
    static var previews: some View {
        MovieView(movie: MovieUIModel(id: 77, title: "Mowgli", thumbnail: "", overview: "Loren epsum", date: "09/11/1990"))
    }
}
