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
        let viewModel = VideosViewModel(netWorkService: NetworkService())
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
