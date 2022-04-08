//
//  MoviesHomeViewModel.swift
//  MoviesHome
//
//  Created by Amr Hesham on 07/04/2022.
//

import Foundation

// MARK: - MoviesHomeViewModel
//
class MoviesHomeViewModel: ViewModel {
    
    // MARK: - Properties
    let moviesSubject: PublishSubject<[Movie]> = PublishSubject<[Movie]>()
    
    private let disposeBag = DisposeBag()
    private let store: MoviesStoreProtocol
    
    private var movies: [Movie] = []
    
    var moviesCount: Int {
        return movies.count
    }
    
    // MARK: - Init
    
    init(store: MoviesStoreProtocol = MoviesStore()) {
        self.store = store
        super.init()
    }
    
    func viewDidLoad() {
        state.send(.loading)
        store.loadMovies(for: 1, completion: { [weak self] in
            switch $0 {
            case .success(let response):
                self?.state.send(.success)
                self?.didReceiveMovies(response)
            case .failure(let error):
                self?.handleError(error)
            }
        })
    }
    
    func movieAt(_ index: Int) -> Movie? {
        guard index < movies.count - 1 else { return nil }
        return movies[index]
    }
    
}

// MARK: - Private helper
//
private extension MoviesHomeViewModel {
    
    /// Called when the exchange rate is received
    /// - Parameters:
    ///   - currency: returned object from the API containts the exhange rate
    func didReceiveMovies(_ moviesResponse: MoviesListResponse) {
        if let movies = moviesResponse.results {
            DispatchQueue.main.async { [weak self] in
                self?.movies = movies
                self?.moviesSubject.send(movies)
            }
            
        }
    }
    
    func handleError(_ error: Error) {
        state.send(.failure(error))
    }
}

