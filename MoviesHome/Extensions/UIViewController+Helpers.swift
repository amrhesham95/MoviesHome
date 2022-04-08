//
//  UIViewController+Helpers.swift
//  MoviesHome
//
//  Created by Amr Hesham on 07/04/2022.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, retryAction: (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if retryAction != nil {
            alertViewController.addAction(UIAlertAction(title: Strings.cancel, style: .default))
        }
        let title = (retryAction == nil) ? Strings.ok : Strings.retry
        alertViewController.addAction(UIAlertAction(title: title, style: .default) { _ in
            retryAction?()
        })
        present(alertViewController, animated: true)
    }
    
    func setNavbarTransculent() {
        navigationController?.navigationBar.tintColor = .appTheme()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.appTheme()]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func setNavbar(backgroundColorAlpha alpha: CGFloat) {
        let themeColor = UIColor(hex: APP_COLOR.THEME.rawValue, alpha: alpha) //your color
        let newColor = UIColor.white.withAlphaComponent(alpha)
        
        navigationController?.navigationBar.backgroundColor = themeColor
        if alpha == 1 {
            navigationController?.navigationBar.tintColor = newColor
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: newColor]
        } else {
            navigationController?.navigationBar.tintColor = .appTheme()
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.appTheme()]
        }

    }
}

