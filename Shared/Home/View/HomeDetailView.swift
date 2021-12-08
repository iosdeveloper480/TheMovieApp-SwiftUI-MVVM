//
//  HomeDetailView.swift
//  TheMovieApp SwiftUI (iOS)
//
//  Created by Waqas Ali on 08/12/2021.
//

import SwiftUI

struct HomeDetailView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    @State var movieId = ""
    
    var body: some View {
        VStack {
            if let movie = viewModel.movieDetail {
                VStack(alignment: .leading) {
//                    Text(movie.title)
//                        .font(Font.system(.title))
//                        .fontWeight(.bold)
                    AsyncImage(url: URL(string: Constants.URL.urlImages+movie.posterPath)) { image in
                        image.resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .padding(.vertical)
                    } placeholder: {
                        ProgressView()
                    }
                    Text("Sinopsis")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Text(movie.overview)
                        .fontWeight(.regular)
                        .padding(.horizontal)
                        .padding(.vertical, 1)
                    
                    Text("Release Date")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    Text(movie.releaseDate)
                        .fontWeight(.regular)
                        .padding(.horizontal)
                    
                    Text("Vote")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    Text("\(movie.voteAverage)")
                        .fontWeight(.regular)
                        .padding(.horizontal)
                    
                    Text("Vote")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    Text("\(movie.voteAverage)")
                        .fontWeight(.regular)
                        .padding(.horizontal)
                    Spacer()
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .navigationTitle(movie.title)
            } else {
                Text("Error Loading Movie Details")
            }
        }
        .task {
            await viewModel.getMovieDetail(movieId: movieId)
        }
    }
}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailView(movieId: "877183")
    }
}
