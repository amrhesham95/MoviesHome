//
//  FavoritesViewModel.swift
//  MoviesHome
//
//  Created by Amr Hesham on 12/04/2022.
//

import Foundation

class FavoritesViewModel: ViewModel {
    // MARK: - Properties
    let favoritesSubject: PublishSubject<([StorageMovie])> = PublishSubject<([StorageMovie])>()
    
    private let disposeBag = DisposeBag()
    private let storage: StorageManagerProtocol
    
    private var movies: [StorageMovie] = []
    
    var moviesCount: Int {
        return movies.count
    }
    
    func movieAt(_ index: Int) -> StorageMovie? {
        guard index < movies.count - 1 else { return nil }
        return movies[index]
    }

    init(storage: StorageManagerProtocol = RealmStorage()) {
        self.storage = storage
        super.init()
    }
    
    func getFavorites() {
        let query = "isFavorite == \(true)"
        let predicate = NSPredicate(format: query)
        let storageMovies = storage
            .getAllObjects(ofType: StorageMovie.self, matching: predicate)
        movies = storageMovies
        favoritesSubject.send(movies)
    }
}
