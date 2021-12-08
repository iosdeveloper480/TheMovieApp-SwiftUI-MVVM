////  Created by Waqas Ali.
//  Copyright © 2021 Waqas Ali. All rights reserved.
//  Contact waqasaliw@gmail.com

import Foundation

struct Constants {
    static let apiKey = "?api_key=YOUR_API_KEY"
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct Endpoints {
           static let urlListPopularMovies = "3/movie/popular"
           static let urlDetailMovie = "3/movie/"
       }
}
