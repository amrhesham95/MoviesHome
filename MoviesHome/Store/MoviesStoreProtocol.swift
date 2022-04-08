//
//  Store.swift
//  CCCalculator
//
//  Created by Amr Hesham on 07/04/2022.
//

import Foundation

// MARK: - Typealias
typealias GetMoviesCompletion = (Result<MoviesListResponse, Error>) -> Void

// MARK: - Store
//
protocol MoviesStoreProtocol {
    var network: NetworkService { get }
    func loadMovies(for pageNum: Int, completion: @escaping GetMoviesCompletion)
}
