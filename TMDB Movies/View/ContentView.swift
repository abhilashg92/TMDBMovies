//
//  ContentView.swift
//  TMDB Movies
//
//  Created by Kiwi on 29/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: VideosViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailsView(movie: movie)
                        } label: {
                            MovieView(movie: movie)
                        }
                    }
                }
                .navigationTitle(Strings.moviesTitle)
            }
            .searchable(text: $viewModel.searchText)
            .autocorrectionDisabled()
            .onSubmit(of: .search, viewModel.fetchMovies)
            .onChange(of: viewModel.searchText) { newValue in
                viewModel.fetchMovies()
            }
            if viewModel.movies.isEmpty {
                Text(Strings.searchMovies)
                    .font(.largeTitle)
            }
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = VideosViewModel(netWorkService: NetworkService())
        ContentView()
            .environmentObject(vm)
    }
}
