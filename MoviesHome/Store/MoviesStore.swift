//
//  CurrencyStore.swift
//  CCCalculator
//
//  Created by Amr Hesham on 07/04/2022.
//

import Foundation
protocol StorageManagerProtocol {
    func updateObject<T>(_ object: T) throws
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
        let movies = getCachedMoviesFor(pageNum)
        
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
                self?.insertMovies(pageId: pageNum, moviesResponse: response, completion: completion)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - Cache Handlers
//
extension MoviesStore {
    func insertMovies(pageId: Int, moviesResponse: MoviesListResponse?, completion: @escaping GetMoviesCompletion) {
        if let movies = moviesResponse?.results
        {
            let storageMovies = movies.map { $0.storageMovie(pageID: pageId)}
            DispatchQueue.main.async {  [weak self] in
                storageMovies.forEach { storageMovie in
                    try? self?.storageManager.updateObject(storageMovie)
                }
                let movies = self?.getCachedMoviesFor(pageId)
                completion(.success(movies ?? []))
            }
        }
    }
    
    func getCachedMoviesFor(_ pageNum: Int) -> [StorageMovie] {
        let query = "pageID == \(pageNum)"
        let predicate = NSPredicate(format: query)
        var movies: [StorageMovie]?
        movies = storageManager
                .getAllObjects(ofType: StorageMovie.self, matching: predicate)
        return movies ?? []
    }
    
    func updateMovie(storageMovie: StorageMovie, pageID: Int) {
        storageMovie.isFavorite ? deleteFromFavorite(movie: Movie(storage: storageMovie), pageID: pageID) : addToFavorite(movie: Movie(storage: storageMovie), pageID: pageID)
    }
    
    func deleteFromFavorite(movie: Movie, pageID: Int) {
        do {
            let storageMovie = movie.storageMovie(pageID: pageID)
            storageMovie.isFavorite = false
            try storageManager.updateObject(storageMovie)
        } catch {
            print(error)
        }
    }
    
    func addToFavorite(movie: Movie, pageID: Int) {
        do {
            let storageMovie = movie.storageMovie(pageID: pageID)
            storageMovie.isFavorite = true
            try storageManager.updateObject(storageMovie)
        } catch {
            print(error)
        }
    }
}
