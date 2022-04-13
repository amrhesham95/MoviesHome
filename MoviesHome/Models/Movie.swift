//
//  Movie.swift
//  MoviesHome
//
//  Created by Amr Hesham on 07/04/2022.
//

import Foundation
struct Movie: Codable, Hashable {
    init(storage: StorageMovie) {
        self.popularity = storage.popularity
        self.vote_count = storage.vote_count
        self.video = storage.video
        self.poster_path = storage.poster_path
        self.id = Int(storage.movieID)
        self.adult = storage.adult
        self.backdrop_path = storage.backdrop_path
        self.original_language = storage.original_language
        self.original_title = storage.original_title
        self.genre_ids = []
        self.title = storage.title
        self.vote_average = storage.vote_average
        self.overview = storage.overview
        self.release_date = storage.release_date
    }
    
    let popularity : Double?
    let vote_count : Int?
    let video : Bool?
    let poster_path : String?
    let id : Int?
    let adult : Bool?
    let backdrop_path : String?
    let original_language : String?
    let original_title : String?
    let genre_ids : [Int]?
    let title : String
    let vote_average : Double?
    let overview : String?
    let release_date : String?

    enum CodingKeys: String, CodingKey {

        case popularity = "popularity"
        case vote_count = "vote_count"
        case video = "video"
        case poster_path = "poster_path"
        case id = "id"
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case original_language = "original_language"
        case original_title = "original_title"
        case genre_ids = "genre_ids"
        case title = "title"
        case vote_average = "vote_average"
        case overview = "overview"
        case release_date = "release_date"
    }
}

extension Movie {
    func storageMovie(pageID: Int) -> StorageMovie {
        let storageMovie = StorageMovie()
        storageMovie.popularity = popularity ?? 0
        storageMovie.vote_count = vote_count ?? 0
        storageMovie.poster_path = poster_path ?? ""
        storageMovie.movieID = id?.description ?? UUID().uuidString
        storageMovie.title = title
        storageMovie.pageID = pageID
        storageMovie.overview = overview ?? ""
        return storageMovie
    }
}
