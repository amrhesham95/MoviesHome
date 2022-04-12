//
//  FavoritesViewModel.swift
//  MoviesHome
//
//  Created by Amr Hesham on 12/04/2022.
//

import Foundation

class FavoritesViewModel: ViewModel {
    // MARK: - Properties
    let favoritesSubject: PublishSubject<([Movie])> = PublishSubject<([Movie])>()
    
    private let disposeBag = DisposeBag()
    private let storage: StorageManagerProtocol
    
    private var movies: [Movie] = []
    
    var moviesCount: Int {
        return movies.count
    }
    
    func movieAt(_ index: Int) -> Movie? {
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
        let movies = storage
            .getAllObjects(ofType: StorageMovie.self, matching: predicate)
            .map { Movie(storage: $0) }
        favoritesSubject.send(movies)
    }
}
