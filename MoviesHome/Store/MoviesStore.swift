//
//  CurrencyStore.swift
//  CCCalculator
//
//  Created by Amr Hesham on 07/04/2022.
//

import Foundation
protocol StorageManagerProtocol {
    func insert<T>(object: T) throws
    func getAllObjects<T>(ofType type: T.Type, matching predicate: NSPredicate?) -> [T]
}
// MARK: - CurrencyStore
//
class MoviesStore: MoviesStoreProtocol {
    
    // MARK: - Properties
    
    var network: NetworkService
    let storageManager: StorageManagerProtocol
    // MARK: - Init
    init(network: NetworkService = NetworkAPIClient(),
         storageManager: StorageManagerProtocol = RealmStorage()) {
        self.network = network
        self.storageManager = storageManager
    }
}

// MARK: - Network Handlers
extension MoviesStore {
    func loadMovies(for pageNum: Int, completion: @escaping GetMoviesCompletion) {
        let query = "pageID == \(pageNum)"
        let predicate = NSPredicate(format: query)
        
        let movies = storageManager
            .getAllObjects(ofType: StorageMovie.self, matching: predicate)
            .map { Movie(storage: $0) }
        
        if movies.isEmpty {
            loadFromRemoteIfNeeded(for: pageNum, completion: completion)
        } else {
            completion(.success(movies))
        }
    }
    
    private func loadFromRemoteIfNeeded(for pageNum: Int, completion: @escaping GetMoviesCompletion) {
        let endPoint = MovieDBAPI.getMoviesFor(page: pageNum)
        
        network.dataRequest(endPoint, objectType: MoviesListResponse.self) { [weak self] in
            switch $0 {
            case let .success(response):
                completion(.success(response.results ?? []))
                self?.insertMovies(pageId: pageNum, moviesResponse: response)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - Cache Handlers
//
extension MoviesStore {
    func insertMovies(pageId: Int, moviesResponse: MoviesListResponse?) {
        if let movies = moviesResponse?.results
        {
            let storageMovies = movies.map { $0.storageMovie(pageID: pageId)}
            storageMovies.forEach { storageMovie in
                DispatchQueue.main.async { [weak self] in
                    try? self?.storageManager.insert(object: storageMovie)
                }
            }
        }
    }
}
