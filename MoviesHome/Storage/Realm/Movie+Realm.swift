//
//  Movie+Realm.swift
//  MoviesHome
//
//  Created by Amr Hesham on 09/04/2022.
//

import Foundation
import RealmSwift

// MARK: - StorageMovie
//
final class StorageMovie: Object {
    
    @objc dynamic var pageID: Int = 0
    @objc dynamic var popularity: Double = 0
    @objc dynamic var vote_count: Int = 0
    @objc dynamic var video: Bool = false
    @objc dynamic var poster_path: String = ""
    @objc dynamic var movieID: String = ""
    @objc dynamic var adult: Bool = false
    @objc dynamic var backdrop_path: String = ""
    @objc dynamic var original_language: String = ""
    @objc dynamic var original_title: String = ""
//    @objc dynamic var genre_ids: [Int] = []
    @objc dynamic var title: String = ""
    @objc dynamic var vote_average: Double = 0
    @objc dynamic var overview: String = ""
    @objc dynamic var release_date: String = ""

    override static func primaryKey() -> String? {
        return "movieID"
    }
}

