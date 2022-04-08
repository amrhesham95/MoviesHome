//
//  ButtonAction.swift
//  CFC
//
//  Created by Amr Hesham on 28/01/2021.
//  Copyright © 2021 VictoryLink. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ButtonAction
//
class ButtonAction: NSObject {
  
  /// Handler
  ///
  typealias Handler = ((ButtonAction) -> Void)
  
  // MARK: Properties
  
  /// Title
  ///
  let title: String?
  
  /// Alert style
  ///
  let style: Style
  
  /// Alert handler
  ///
  let handler: Handler?
  
  // MARK: Init
  
  init(title: String?, style: Style, handler: Handler? = nil) {
    self.title = title
    self.style = style
    self.handler = handler
    super.init()
  }
  
  // MARK: - Computed Properties
  
  /// Alert button
  ///
  lazy var button: UIButton = {
    let button = makeButton()
    configureOnTapButton(button)
    return button
  }()
  
  // MARK: - Handlers
  
  /// Called when use taps the button
  ///
  @objc private func didTapButton(_ sender: UIButton) {
    handler?(self)
  }
}

// MARK: - Button Maker
//
private extension ButtonAction {
  
  /// Returns a button for the current action style.
  ///
  func makeButton() -> UIButton {
    switch style {
    case .default:
      return buildFilledButton()
    case .accent, .destructive:
      return buildCancelButton()
    case .defaultLoading:
      return buildLoadingButton()
    }
  }
  
  /// Configure button on tap action
  ///
  func configureOnTapButton(_ button: UIButton) {
    button.addTarget(self,
                     action: #selector(didTapButton(_:)),
                     for: .touchUpInside)
  }
  
  /// Make a fileld button, used by default.
  ///
  func buildFilledButton() -> UIButton {
    let button = UIButton(type: .system)
    button.applyPrimaryFilledStyle()
    button.setTitle(title, for: .normal)
    return button
  }
  
  /// Make cancel button, used for cancel style.
  ///
  func buildCancelButton() -> UIButton {
    let button = UIButton(type: .system)
    button.applySecondaryFilledStyle()
    button.setTitle(title, for: .normal)
    return button
  }
  
  /// Build default loading button
  ///
  func buildLoadingButton() -> UIButton {
    let button = LoadingButton(type: .system)
    button.applyPrimaryFilledStyle()
    button.setTitle(title, for: .normal)
    return button
  }
}

// MARK: - Style
//
extension ButtonAction {
  
  /// Button Style
  ///
  enum Style {
    
    /// Default style
    ///
    case `default`
    
    /// Default loadable style; Use a loading button instead if a normal button.
    ///
    case defaultLoading
    
    /// Cancel style
    ///
    case accent
    
    /// Desctructive action
    ///
    case destructive
  }
}
