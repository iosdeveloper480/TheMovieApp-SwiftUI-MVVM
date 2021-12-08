//
//  Movies.swift
//  TheMovieApp SwiftUI (iOS)
//
//  Created by Waqas Ali on 08/12/2021.
//

import Foundation

struct Movies :Codable {
    let listOfMovies : [Movie]
    enum CodingKeys: String, CodingKey {
        case listOfMovies = "results"
    }
}

struct Movie:Codable, Identifiable {
    var id = UUID()
    let title:String
    let popularity:Double
    let movieID:Int
    let voteCount:Int
    let originalTitle:String
    let voteAverage:Double
    let sinopsis:String
    let releaseDate:String
    let image:String
    
    enum CodingKeys:String, CodingKey {
        case title
        case popularity
        case movieID = "id"
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case image = "poster_path"
    }
}


