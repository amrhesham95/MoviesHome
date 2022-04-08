

import UIKit.UIFont

/// App Font Helpers
extension UIFont {
  
  private struct CCFont {
    private let nameAr: String
    private let nameEn: String
    
    static let bold = CCFont(nameAr: "HelveticaNeue-Medium",
                             nameEn: "HelveticaNeue-Medium")
    static let regular = CCFont(nameAr: "HelveticaNeue",
                                nameEn: "HelveticaNeue")
    static let light = CCFont(nameAr: "HelveticaNeue-Light",
                              nameEn: "HelveticaNeue-Light")
    
    var name: String {
      return "HelveticaNeue-Medium"
//      return Localize.isArabic ? nameAr : nameEn
    }
    
    init(nameAr: String, nameEn: String) {
      self.nameAr = nameAr
      self.nameEn = nameEn
    }
  }
  
  enum FontType: String {
    case bold
    case regular
    case light
    
    var rawValue: String {
      switch self {
      case .bold:
        return CCFont.bold.name
      case .regular:
        return CCFont.regular.name
      case .light:
        return CCFont.light.name
      }
    }
  }
}
