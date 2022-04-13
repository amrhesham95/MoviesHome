//
//  MainTabBarController.swift
//  MoviesHome
//
//  Created by Amr Hesham on 12/04/2021.
//

import UIKit

// MARK: - MainTabBarController
//
class MainTabBarController: UITabBarController {
  
  // MARK: - Properties
  
  private let moviesCoordinator: MoviesCoordinator = {
    return MoviesCoordinator(navigationController: UINavigationController())
  }()
  
  private let favoritesViewController: FavoritesViewController = {
    return FavoritesViewController()
  }()
  
  func showMoviesScreen() {
    moviesCoordinator.start()
    configureTabViewControllers()
    configureTabBarItems()
  }


  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    moviesCoordinator.start()
    configureTabViewControllers()
    configureTabBarItems()
  }
}

// MARK: - Helpers
//
private extension MainTabBarController {
  
  /// Configure tab view controllers,
  /// used at view initialization to setup the visible view controllers.
  ///
  func configureTabViewControllers() {
    viewControllers?.removeAll()
    viewControllers = {
      var controllers = viewControllers ?? []
      
      let moviesTabIndex = AppTab.movies.visibleIndex()
        controllers.insert(moviesCoordinator.navigationController, at: moviesTabIndex)
      
      let favoritesTabIndex = AppTab.favorites.visibleIndex()
      controllers.insert(UINavigationController(rootViewController: favoritesViewController), at: favoritesTabIndex)

      
      return controllers
    }()
  }
  
  /// Create TabBar items for visible items
  ///
  func configureTabBarItems() {
   
    let moviesTab = UITabBarItem(title: "Movies", image: UIImage(named: ""), selectedImage: nil)
      moviesCoordinator.navigationController.tabBarItem = moviesTab
    
    let favoritesTab = UITabBarItem(title: "Favorite", image: UIImage(named: ""), selectedImage: nil)
    favoritesViewController.navigationController?.tabBarItem = favoritesTab
  }
}
