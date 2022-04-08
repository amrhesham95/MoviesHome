//
//  CurrencyStore.swift
//  CCCalculator
//
//  Created by Amr Hesham on 07/04/2022.
//

import Foundation

// MARK: - CurrencyStore
//
class MoviesStore: MoviesStoreProtocol {
    
    // MARK: - Properties
    
    var network: NetworkService
    
    // MARK: - Init
    init(network: NetworkService = NetworkAPIClient()) {
        self.network = network
    }
}

// MARK: - Network Handlers
extension MoviesStore {
    func loadMovies(for pageNum: Int, completion: @escaping GetMoviesCompletion) {
        let endPoint = MovieDBAPI.getMoviesFor(page: pageNum)
        network.dataRequest(endPoint, objectType: MoviesListResponse.self) {
            switch $0 {
            case let .success(response):
                completion(.success(response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
