//
//  LoadingButton.swift
//  CFC
//
//  Created by Amr Hesham on 21/03/2021.
//  Copyright © 2021 VictoryLink. All rights reserved.
//

import UIKit

// MARK: - LoadingButton
//
class LoadingButton: UIButton {
  
  /// Original text is exists
  ///
  private var originalButtonText: String?
  
  /// Activity indicator
  ///
  private var activityIndicator: UIActivityIndicatorView?
  
  // MARK: Handlers
  
  /// Show loading
  ///
  func showLoading() {
    originalButtonText = titleLabel?.text
    setTitle("", for: .normal)
    
    if activityIndicator == nil {
      activityIndicator = createActivityIndicator()
    }
    
    showSpinning()
    isEnabled = false
  }
  
  /// Hide Loading
  ///
  func hideLoading() {
    setTitle(originalButtonText, for: .normal)
    activityIndicator?.stopAnimating()
    isEnabled = true
  }
}

// MARK: - Create Indicator
//
private extension LoadingButton {
  
  func createActivityIndicator() -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.hidesWhenStopped = true
    activityIndicator.color = .textInverted
    return activityIndicator
  }
}

// MARK: - Private Handlers
//
private extension LoadingButton {
  
  func showSpinning() {
    guard let activityIndicator = self.activityIndicator else {
      return
    }
    
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    addSubview(activityIndicator)
    centerActivityIndicatorInButton()
    activityIndicator.startAnimating()
  }
  
  func centerActivityIndicatorInButton() {
    let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
    self.addConstraint(xCenterConstraint)
    
    let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
    self.addConstraint(yCenterConstraint)
  }
}
