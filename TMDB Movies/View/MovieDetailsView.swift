//
//  MovieDetailsView.swift
//  TMDB Movies
//
//  Created by Kiwi on 01/08/23.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var movie: MovieUIModel
    
    var body: some View {
        ScrollView {
            VStack() {
                AsyncImage(url: URL(string: movie.thumbnail ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                        .scaledToFit()
                }
                .background(Color.gray)
                .frame(height:300)
                VStack(alignment: .leading, spacing: 10) {
                    Text(movie.title ?? "")
                        .font(.title)
                    Text(movie.overview ?? "")
                }
            }
            .padding(20)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: MovieUIModel(id: 99, title: "Batman", thumbnail: "https://picsum.photos/200/300?grayscale", overview: "Loren ipsum", date: "09/11/2002"))
    }
}
