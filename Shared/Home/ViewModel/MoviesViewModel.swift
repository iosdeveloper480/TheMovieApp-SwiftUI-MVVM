//
//  MoviesViewModel.swift
//  TheMovieApp SwiftUI (iOS)
//
//  Created by Waqas Ali on 08/12/2021.
//

import SwiftUI

@MainActor class MoviesViewModel: ObservableObject {
    
    @Published var movies = Movies(listOfMovies: [])
    @Published var movieDetail: MovieDetail?
    
    private let managerConnections = ManagerConections()
    
    func getMovies() async {
        if let movies = await managerConnections.getMovies() {
            self.movies = movies
        }
    }
    
    func getMovieDetail(movieId: String) async {
        self.movieDetail = await managerConnections.getDetailMovies(movieId: movieId)
    }
}
