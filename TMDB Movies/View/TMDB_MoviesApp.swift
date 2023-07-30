//
//  TMDB_MoviesApp.swift
//  TMDB Movies
//
//  Created by Kiwi on 29/07/23.
//

import SwiftUI

@main
struct TMDB_MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: VideosViewModel(netWorkService: NetworkService()))
        }
    }
}
