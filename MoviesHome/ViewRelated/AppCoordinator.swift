//
//  AppCoordinator.swift
//  MoviesHome
//
//  Created by Amr Hesham on 12/04/2021.
//

import UIKit

class MoviesCoordinator {
    // MARK: - Properties
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Handlers
    
    func start() {
        showMoviesHomeViewController()
    }
    
    /// Show movies home view controller
    private func showMoviesHomeViewController() {
        let viewController = MoviesHomeViewController()
        viewController.coordinator = self
        self.navigationController.setViewControllers([viewController], animated: false)
    }

    func showMovieDetailsViewController(movieImageURL: URL?, movieDescription: String, movieTitle: String) {
        let viewController = DetailsViewController(movieImageURL: movieImageURL, movieDescription: movieDescription, movieTitle: movieTitle)
        self.navigationController.pushViewController(viewController, animated: false)
    }
}
// MARK: - AppCoordinator
//
class AppCoordinator {
    
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    /// Tab Bar Controller
    ///
    lazy var tabBarController: MainTabBarController? = {
        MainTabBarController()
    }()
    
    
    // MARK: - init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Start
    
    func start() {
        showMoviesScreen()
    }
}

// MARK: - Coordination Helpers
//
extension AppCoordinator {
    
    /// Show MoviesViewController.
    ///
    func showMoviesScreen() {
        tabBarController?.showMoviesScreen()
    }
}

