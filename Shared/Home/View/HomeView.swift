//
//  HomeView.swift
//  TheMovieApp SwiftUI (iOS)
//
//  Created by Waqas Ali on 08/12/2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.movies.listOfMovies) { movie in
                NavigationLink {
                    HomeDetailView(movieId: "\(movie.movieID)")
                } label: {
                    HomeCell(movieModel: movie)
                }
            }
            .listStyle(PlainListStyle())
            .task {
                await viewModel.getMovies()
            }
            .refreshable {
                await viewModel.getMovies()
            }
            
            .navigationTitle("Movies List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
