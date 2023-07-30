//
//  ContentView.swift
//  TMDB Movies
//
//  Created by Kiwi on 29/07/23.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel: VideosViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.movies) { movie in
                        MovieView(movie: movie)
                            .padding(10)
                    }
                }
                .navigationTitle(NavigationTitle.moviesTitle)
            }
            .searchable(text: $viewModel.searchText)
            .onSubmit(of: .search, viewModel.fetchMovies)
            .onChange(of: viewModel.searchText) { newValue in
                viewModel.fetchMovies()
        }
            Text("Search Movies")
                .statusBarHidden(!viewModel.movies.isEmpty)
        }
    }
}
 
