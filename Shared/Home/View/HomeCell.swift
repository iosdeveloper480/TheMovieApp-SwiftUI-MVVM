//
//  HomeCell.swift
//  TheMovieApp SwiftUI (iOS)
//
//  Created by Waqas Ali on 08/12/2021.
//

import SwiftUI

struct HomeCell: View {
    
    @State var movieModel: Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: Constants.URL.urlImages + movieModel.image)) { image in
                image.resizable()
                    .frame(width: 160, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.vertical)
                
            } placeholder: {
                ProgressView()
                    .frame(width: 160, height: 250)
            }
            VStack(alignment: .leading) {
                Text("Title")
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Text(movieModel.title)
                    .padding(.horizontal)
                    .padding(.vertical, 1)
                
                Text("Description")
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.vertical, 1)
                
                Text(movieModel.sinopsis)
                    .fontWeight(.regular)
                    .lineLimit(2)
                    .padding(.horizontal)
                    .padding(.vertical, 1)
            }
        }
    }
}

struct HomeCell_Previews: PreviewProvider {
    @State static var model = Movie(title: "Any", popularity: 1, movieID: 1, voteCount: 1, originalTitle: "Original Title", voteAverage: 5, sinopsis: "Description of the movie", releaseDate: "12 December 2021", image: "")
    static var previews: some View {
        HomeCell(movieModel: model)
    }
}
