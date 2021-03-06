//
//  MovieDBAPI.swift
//  AssignmentBMS
//
//  Created by Ajay on 10/10/20.
//  Copyright © 2020 Ajay Bhanushali. All rights reserved.
//

import Foundation

enum MovieDBAPI: APIEndPoint, URLRequestConvertible {
    case getMoviesFor(page: Int)
    case getMovieSynopsis(id: Int)
    case getMovieReviews(id: Int, page: Int)
    case getCredits(id: Int)
    case getSimilarMovies(id: Int, page: Int)
    case getVideosFor(id: Int)
}

extension MovieDBAPI {
    
    var baseURL: URL {
        return URL(string: APIConstants.movieDBAPIBaseURL)!
    }
    
    var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case .getMoviesFor:
            return "/3/movie/now_playing"
        case let .getMovieSynopsis(id):
            return "/3/movie/" + id.description
        case let .getMovieReviews(id, _):
            return "/3/movie/" + id.description + "/reviews"
        case let .getCredits(id):
            return "/3/movie/" + id.description + "/credits"
        case let .getSimilarMovies(id, _):
            return "/3/movie/" + id.description + "/similar"
        case let .getVideosFor(id):
            return "/3/movie/" + id.description + "/videos"
        }
        
    }
    
    var parameters: [String : Any] {
        switch self {
        case let .getMoviesFor(page), let .getMovieReviews(_, page), let .getSimilarMovies(_, page):
            return [
                "api_key": APIConstants.movieDBAPIKey,
                "language": "en-US",
                "page": page
            ]
            
        default:
            return [
                "api_key": APIConstants.movieDBAPIKey,
                "language": "en-US"
            ]
        }
    }
    
}

//MARK: NetworkAPI Constants
enum APIConstants {
    static let movieDBAPIBaseURL = "https://api.themoviedb.org"
    static let movieDBImagesBaseURL = "https://image.tmdb.org/t/p/w300"
    static let movieDBAPIKey = "53fe06c2962928e5757c34490a1fbf9a" //Change the API Key here
}
