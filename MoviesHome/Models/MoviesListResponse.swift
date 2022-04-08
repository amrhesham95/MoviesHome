//
//  MoviesListResponse.swift
//  MoviesHome
//
//  Created by Amr Hesham on 07/04/2022.
//

import Foundation

struct MoviesListResponse: Codable {
    
    let results: [Movie]?
    let page: Int?
    let total_results: Int?
    let total_pages: Int?

    enum CodingKeys: String, CodingKey {

        case results = "results"
        case page = "page"
        case total_results = "total_results"
        case total_pages = "total_pages"
    }
}
