//
//  BaseViewController.swift
//  CCCalculator
//
//  Created by Amr Hesham on 08/04/2021.
//

import UIKit

// MARK: - ViewController
//
class BaseViewController: UIViewController {
  
  // MARK: - Properties
  
  /// DisposeBag
  ///
  let disposeBag = DisposeBag()
  
}


// MARK: - ViewModel + State Binding Helpers
//
extension BaseViewController {
  
  /// Bind loading state to ViewModel type
  ///
  /// - Parameter viewModel: ViewModel
  ///
  func bindLoadingState(to viewModel: ViewModel) {
    viewModel.state.subscribe { [weak self] state in
      guard let self = self else { return }
      self.shouldShowProgressView(state == .loading, type: self.progressType)
    }.disposed(by: disposeBag)
  }
  
  /// Bind error state to ViewModel type
  ///
  /// - Parameter viewModel: ViewModel
  ///
  func bindErrorState(to viewModel: ViewModel) {
    return viewModel.state.subscribe { [weak self] state in
      guard let self = self else { return }
      if case .failure(let error) = state {
        DispatchQueue.main.async { [weak self] in 
          let alertController =  UIAlertController(title: "Conversion Failed", message: error.localizedDescription, preferredStyle: .alert)
          let alertAction = UIAlertAction(title: "OK", style: .default)
          alertController.addAction(alertAction)
          self?.present(alertController, animated: true)
        }
      }
    }.disposed(by: disposeBag)
  }
}
