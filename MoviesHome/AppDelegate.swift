//
//  AppDelegate.swift
//  MoviesHome
//
//  Created by Amr Hesham on 07/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    /// AppDelegate's Instance
    ///
    static var shared: AppDelegate {
      guard let appInstance = UIApplication.shared.delegate as? AppDelegate else {
        fatalError()
      }
      return appInstance
    }
    
    /// Main Window
    ///
    var window: UIWindow?
    
    /// Coordinates app navigation.
    ///
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupWindow()
        return true
    }
}

private extension AppDelegate {
    func setupWindow() {
        window = UIWindow()
        let navigationController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        window?.rootViewController = appCoordinator?.tabBarController

        window?.makeKeyAndVisible()
    }
}
