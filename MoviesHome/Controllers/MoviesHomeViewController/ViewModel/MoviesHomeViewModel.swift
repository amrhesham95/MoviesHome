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
    let moviesSubject: PublishSubject<([Movie], [IndexPath])> = PublishSubject<([Movie], [IndexPath])>()
    
    private let disposeBag = DisposeBag()
    private let store: MoviesStoreProtocol
    
    private var movies: [Movie] = []
    
    var moviesCount: Int {
        return movies.count
    }
    
    var pageNum = Constants.defaultPageNum
    var totalCount = Constants.defaultTotalCount
    var totalPages = Constants.defaultPageNum
    
    var isMoreDataAvailable: Bool {
        guard totalPages != 0 else {
            return true
        }
        return pageNum < totalPages
    }

    
    // MARK: - Init
    init(store: MoviesStoreProtocol = MoviesStore()) {
        self.store = store
        super.init()
    }
    
    func loadMovies(for pageNumber: Int) {
        state.send(.loading)
        store.loadMovies(for: pageNumber, completion: { [weak self] in
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
    
    func posterURL(_ index: Int) -> URL? {
        guard index < movies.count - 1 else { return nil }
        
        guard let path = movies[index].poster_path, let url = URL(string: APIConstants.movieDBImagesBaseURL + path) else {
            return nil
        }
        
        return url
    }
    
    func getMovies() {
        guard isMoreDataAvailable else {
            state.send(.success)
            return
        }
        state.send(.loading)
        pageNum += 1
        loadMovies(for: pageNum)
    }
    
}

// MARK: - Private helper
//
private extension MoviesHomeViewModel {
    
    /// Called when the movies are received
    /// - Parameters:
    ///   - movies: returned movies from the API containts the movies
    func didReceiveMovies(_ movies: [Movie]) {
        if totalCount == Constants.defaultTotalCount {
            totalCount = movies.count
            DispatchQueue.main.async { [weak self] in
                self?.movies.append(contentsOf: movies)
                self?.moviesSubject.send((movies, []))
            }
        } else {
            insertMoreMovies(with: movies)
        }
    }
    
    fileprivate func insertMoreMovies(with movies: [Movie]) {
        let previousCount = totalCount
        totalCount += movies.count
        self.movies.append(contentsOf: movies)
        let indexPaths: [IndexPath] = (previousCount..<totalCount).map {
            return IndexPath(row: $0, section: 0)
        }
        DispatchQueue.main.async { [unowned self] in
            self.moviesSubject.send((movies, indexPaths))
            state.send(.success)
        }
    }

    
    func handleError(_ error: Error) {
        state.send(.failure(error))
    }
}

