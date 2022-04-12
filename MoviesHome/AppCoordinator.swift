//
//  AppCoordinator.swift
//  MoviesHome
//
//  Created by Amr Hesham on 12/04/2021.
//

import UIKit

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

