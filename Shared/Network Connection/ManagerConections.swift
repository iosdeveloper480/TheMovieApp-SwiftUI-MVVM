//
//  ManagerConections.swift
//  TheMovieApp SwiftUI (iOS)
//
//  Created by Waqas Ali on 08/12/2021.
//

import Foundation

class ManagerConections {
    
    func getMovies() async -> Movies? {
        
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: Constants.URL.main+Constants.Endpoints.urlListPopularMovies+Constants.apiKey)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      return nil
                  }
            let decoder = JSONDecoder()
            let movies = try decoder.decode(Movies.self, from: data)
            return movies
        } catch {
            return nil
        }
    }
    
    func getDetailMovies(movieId: String) async -> MovieDetail? {

        let session = URLSession.shared
        var request = URLRequest(url: URL(string: Constants.URL.main+Constants.Endpoints.urlDetailMovie+movieId+Constants.apiKey)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      return nil
                  }
            let decoder = JSONDecoder()
            let movieDetail = try decoder.decode(MovieDetail.self, from: data)
            return movieDetail
        } catch {
            return nil
        }
    }
}
