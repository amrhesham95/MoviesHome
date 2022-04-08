//
//  UISettings.swift
//  YourNews
//
//  Created by Amr Hesham on 23/04/2021.
//

import UIKit

/// UI System Settings
///
struct UISettings {
  
  /// Zero alpha. Equal `zero`
  ///
  static let alphaZero = CGFloat(0)
  
  /// Full alpha. Equal `1`.
  ///
  static let alphaFull = CGFloat(1)
  
  /// DIsabled button alpha. Equal `0.5`.
  ///
  static let alphaDisabledButton = CGFloat(0.5)

  /// Animation default duration
  ///
  static let animationDuration = Double(0.3)
  
  /// Button corner radius, default is `12`
  ///
  static let buttonCornerRadius = CGFloat(12)
  
  /// Default corner radius among UI elements
  ///
  static let defaultCornerRadius = CGFloat(12)
  
  /// Default height for Button and TextField
  ///
  static let defaultHeight = CGFloat(40)
}
