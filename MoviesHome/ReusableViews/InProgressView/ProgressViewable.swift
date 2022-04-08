//
//  ProgressViewable.swift
//  YourNews
//
//  Created by Amr Hesham on 23/04/2021.
//
import UIKit

// MARK: - ProgressViewable
//
protocol ProgressViewable {
    
    /// Default `ProgressType` for loading view.
    var progressType: ProgressViewType { get }
    
    /// Show loading view
    ///
    /// - parameter show: Shows progress view.
    /// - parameter type: set progress view type.
    func shouldShowProgressView(_ show: Bool, type: ProgressViewType)
}
