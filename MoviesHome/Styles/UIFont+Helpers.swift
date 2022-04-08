import UIKit

/// UIFont Constants
///
extension UIFont {
  static var largeTitle: UIFont {
      return .preferredFont(forTextStyle: .largeTitle)
  }

  static var title1: UIFont {
      return .preferredFont(forTextStyle: .title1)
  }

  static var title2: UIFont {
      return font(forStyle: .title2, weight: .semibold)
  }

  static var title3: UIFont {
      return .preferredFont(forTextStyle: .title3)
  }

  static var headline: UIFont {
      return .preferredFont(forTextStyle: .headline)
  }

  static var subheadline: UIFont {
      return .preferredFont(forTextStyle: .subheadline)
  }

  static var body: UIFont {
      return .preferredFont(forTextStyle: .body)
  }

  static var callout: UIFont {
      return .preferredFont(forTextStyle: .callout)
  }

  static var footnote: UIFont {
      return .preferredFont(forTextStyle: .footnote)
  }

  static var caption1: UIFont {
      return .preferredFont(forTextStyle: .caption1)
  }

  static var caption2: UIFont {
      return .preferredFont(forTextStyle: .caption2)
  }
}

/// UIFont App Constants
///
extension UIFont {
  
  static var bold: UIFont {
    return UIFont.font(forStyle: .body, weight: .bold)
  }
  
  /// Navigation bar large title font. Use `largeTitle` and `semibold` weight.
  ///
  static var navLargeTitle: UIFont {
    return UIFont.font(forStyle: .largeTitle, weight: .semibold)
  }
  
  /// Navigation bar title font. Use `body` and `semibold` weight.
  ///
  static var navTitle: UIFont {
    return UIFont.font(forStyle: .body, weight: .semibold)
  }
}

/// UIFont Helpers
///
extension UIFont {
  
  /// Returns a UIFont instance for the specified Style + Weight.
  ///
  class func font(forStyle style: UIFont.TextStyle, weight: UIFont.Weight) -> UIFont {
    let targetSize = pointSize(for: style)
    return UIFont.systemFont(ofSize: targetSize, weight: weight)
  }
  
  /// Returns the System's Point Size for the specified Style.
  ///
  private class func pointSize(for style: UIFont.TextStyle) -> CGFloat {
    let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
    let initialFont = UIFont(descriptor: descriptor, size: CGFloat(0.0))
    let scaledFont = UIFontMetrics(forTextStyle: style).scaledFont(for: initialFont)
    
    return scaledFont.pointSize
  }
}
