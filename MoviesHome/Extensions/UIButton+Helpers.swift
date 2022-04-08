//
//  UIButton+Helpers.swift
//  YourNews
//
//  Created by Amr Hesham on 23/04/2021.
//

import UIKit

// MARK: - Appearance
//
extension UIButton {
  
  /// Apply default appearance
  ///
  func applyDefaultAppearance() {
    setTitleColor(.primary, for: .normal)
    titleLabel?.font = .body
//    cornerRadius = UISettings.buttonCornerRadius
//    applyDefaultHeight()
  }
  
  /// Apply default inverted appearance
  ///
  func applyDefaultInvertedStyle() {
    applyDefaultAppearance()
    setTitleColor(.textInverted, for: .normal)
//    cornerRadius = UISettings.buttonCornerRadius
  }

  /// Apply default appearance with primary filled
  ///
  func applyPrimaryFilledStyle() {
    applyDefaultAppearance()
    setTitleColor(.textInverted, for: .normal)
    backgroundColor = .buttonPrimary
  }
  
  /// Apply default appearance with accent filled
  ///
  func applySecondaryFilledStyle() {
    applyDefaultAppearance()
    setTitleColor(.textInverted, for: .normal)
    backgroundColor = .accent
  }
}

// MARK: - Enabled/ Disabled State
//
extension UIButton {

  /// Set enabled button with animation.
  ///
  func setEnabled(_ isEnabled: Bool) {
    UIView.animate(withDuration: 0.3) {
      self.isEnabled = isEnabled
      self.alpha = isEnabled ? UISettings.alphaFull : UISettings.alphaDisabledButton
    }
  }
}
