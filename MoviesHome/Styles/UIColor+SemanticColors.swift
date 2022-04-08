import UIKit

// MARK: - Base colors.
extension UIColor {
    /// Accent. Purple-50 (< iOS 13 and Light Mode) and Purple-30 (Dark Mode)
    ///
    static var accent: UIColor {
        return UIColor(named: "AppAccent") ?? .white
    }
    
    /// Basic Background. cashCallBlue-5
    ///
    static var basicBackground: UIColor {
        return UIColor(named: "AppAccent") ?? .white
    }
    
    /// Brand. cashCallBlue-50 (all versions of iOS, Light and Dark Mode)
    ///
    static var brand: UIColor = .accent
    
    /// Error. Red-50 (< iOS 13 and Light Mode) and Red-30 (Dark Mode)
    ///
    static var error: UIColor {
        return UIColor(light: .withColorStudio(.red, shade: .shade50),
                       dark: withColorStudio(.red, shade: .shade30))
    }
    
    /// Primary. cashCallBlue-50 (< iOS 13 and Light Mode) and cashCallBlue-30 (Dark Mode)
    ///
    static var primary: UIColor {
        return UIColor(named: "AppAccent") ?? .blue
    }
    
    /// Warning. Orange-30 (< iOS 13 and Light Mode) and Orange-50 (Dark Mode)
    ///
    static var warning: UIColor {
        return UIColor(light: .withColorStudio(.orange, shade: .shade30),
                       dark: .withColorStudio(.orange, shade: .shade50))
    }
    
    /// Warning. Orange-5 (< iOS 13 and Light Mode) and Orange-90 (Dark Mode)
    ///
    static var warningBackground: UIColor {
        return UIColor(light: .withColorStudio(.orange, shade: .shade5),
                       dark: .withColorStudio(.orange, shade: .shade90))
    }
    
    /// Blue. Blue-50 (< iOS 13 and Light Mode) and Blue-30 (Dark Mode)
    ///
    static var blue: UIColor {
        return UIColor(light: .withColorStudio(.blue, shade: .shade50),
                       dark: .withColorStudio(.blue, shade: .shade30))
    }
    
    /// Orange. Orange-50 (< iOS 13 and Light Mode) and Orange-30 (Dark Mode)
    ///
    static var orange: UIColor {
        return UIColor(light: .withColorStudio(.orange, shade: .shade50),
                       dark: .withColorStudio(.orange, shade: .shade30))
    }
}

// MARK: - Text Colors.
extension UIColor {
    /// Text link. Pink-50
    ///
    static var textLink: UIColor {
        return .accent
    }
    
    /// Text. Gray-80 (< iOS 13) and `UIColor.label` (> iOS 13)
    ///
    static var text: UIColor {
        if #available(iOS 13, *) {
            return .label
        }
        
        return .gray(.shade80)
    }
    
    /// Text Subtle. Gray-50 (< iOS 13) and `UIColor.secondaryLabel` (> iOS 13)
    ///
    static var textSubtle: UIColor {
        if #available(iOS 13, *) {
            return .secondaryLabel
        }
        
        return .gray(.shade50)
    }
    
    /// Text Tertiary. Gray-20 (< iOS 13) and `UIColor.tertiaryLabel` (> iOS 13)
    ///
    static var textTertiary: UIColor {
        if #available(iOS 13, *) {
            return .tertiaryLabel
        }
        
        return .gray(.shade20)
    }
    
    /// Text Quaternary. Gray-10 (< iOS 13) and `UIColor.quaternaryLabel` (> iOS 13)
    ///
    static var textQuaternary: UIColor {
        if #available(iOS 13, *) {
            return .quaternaryLabel
        }
        
        return .gray(.shade10)
    }
    
    /// Text Inverted. White(< iOS 13 and Light Mode) and Gray-90 (Dark Mode)
    ///
    static var textInverted: UIColor {
        return UIColor(light: .white,
                       dark: .withColorStudio(.gray, shade: .shade90))
    }
    
    /// Text Placeholder. Gray-30 (< iOS 13) and `UIColor.placeholderText` (> iOS 13)
    ///
    static var textPlaceholder: UIColor {
        if #available(iOS 13, *) {
            return .placeholderText
        }
        
        return .gray(.shade30)
    }
    
    /// Cancel Action Text Color.
    ///
    static var modalCancelAction: UIColor {
        return UIColor(light: .accent,
                       dark: .systemColor(.label))
    }
    
    /// Text. cashCallBlue-60 (< iOS 13 and Light Mode) and cashCallBlue-30 (Dark Mode)
    ///
    static var textBrand: UIColor {
        return UIColor(light: .withColorStudio(.wooCommerce, shade: .shade60),
                       dark: .withColorStudio(.wooCommerce, shade: .shade30))
    }
}

// MARK: - Image Colors.
extension UIColor {
    /// Placeholder image tint color.
    ///
    static var placeholderImage: UIColor {
        return .gray(.shade20)
    }
    
    /// Primary gradient colors
    ///
    static var accentGradient: [UIColor] {
        return [.withColorStudio(.purple, shade: .shade30),
                .withColorStudio(.purple, shade: .shade50)]
    }
    
    /// Primary gradient colors
    ///
    static var primaryGradient: [UIColor] {
        return [.withColorStudio(.cyan, shade: .shade50),
                .withColorStudio(.blue, shade: .shade50)]
    }
}

// MARK: - UI elements.
extension UIColor {
    
    /// Navigation Bar Background Color. White(< iOS 13 and Light Mode) and `UIColor.systemThickMaterial` (Dark Mode)
    ///
    static var navBar: UIColor {
        if #available(iOS 13, *) {
            return UIColor(light: .white,
                           dark: .systemColor(.secondarySystemGroupedBackground))
        }
        
        return .white
    }
    
    /// App Tab Bar.
    ///
    static var tabBar: UIColor {
        return .systemColor(.systemGroupedBackground)
    }
    
    /// Divider. Gray-10 (< iOS 13) and `UIColor.separator` (> iOS 13)
    ///
    static var divider: UIColor {
        if #available(iOS 13, *) {
            return .separator
        }
        
        return .withColorStudio(.gray, shade: .shade10)
    }
    
    /// Button Primary Color
    ///
    static var buttonPrimary: UIColor {
        return .primary
    }
    
    /// Button Background Primary Color
    ///
    static var primaryButtonBackground: UIColor {
        return .primary
    }
    
    /// Text Field Primary Color
    ///
    static var textFieldPlaceholderAndLine: UIColor {
        return .primary
    }
    
    /// Button Primary Color
    ///
    static var buttonCancel: UIColor {
        return .accent
    }
    
    /// Button Disabled Background.
    ///
    static var buttonDisabledBackground: UIColor {
        return .groupTableViewBackground
    }
    
    /// Button Disabled Title.
    ///
    static var buttonDisabledTitle: UIColor {
        return .systemColor(.quaternaryLabel)
    }
    
    /// Button Disabled Border.
    ///
    static var buttonDisabledBorder: UIColor {
        return .systemColor(.systemGray3)
    }
    
    /// Ghost cell animation end color. `Gray-5` (Light Mode) and Gray-10 (Dark Mode)
    ///
    static var ghostCellAnimationEndColor: UIColor {
        return UIColor(light: .systemColor(.systemGray6),
                       dark: .systemColor(.systemGray5))
    }
    
    /// Rating star filled color.
    ///
    static var ratingStarFilled: UIColor {
        return UIColor(light: .withColorStudio(.yellow, shade: .shade30),
                       dark: .withColorStudio(.yellow, shade: .shade50))
    }
    
    /// Rating star empty color.
    ///
    static var ratingStarEmpty: UIColor {
        return .systemColor(.systemGray4)
    }
}

// MARK: - Borders.
extension UIColor {
    /// Default border color.
    ///
    static var border: UIColor {
        return .systemColor(.systemGray4)
    }
}

// MARK: - Table Views.
extension UIColor {
    /// List Icon. Gray-20 (< iOS 13) and `UIColor.secondaryLabel` (> iOS 13)
    ///
    static var listIcon: UIColor {
        if #available(iOS 13, *) {
            return .secondaryLabel
        }
        
        return .withColorStudio(.gray, shade: .shade20)
    }
    
    /// List Small Icon. Gray-20 (< iOS 13) and `UIColor.systemGray` (> iOS 13)
    ///
    static var listSmallIcon: UIColor {
        if #available(iOS 13, *) {
            return .systemGray
        }
        
        return .withColorStudio(.gray, shade: .shade20)
    }
    
    static var notificationBadgeColor: UIColor {
        return .withColorStudio(.red, shade: .shade30)
    }
    
    /// List BackGround. Gray-0 (< iOS 13) and `UIColor.systemGroupedBackground` (> iOS 13)
    ///
    static var listBackground: UIColor {
        return .basicBackground
    }
    
    /// List ForeGround. `UIColor.white` (< iOS 13) and `UIColor.secondarySystemGroupedBackground` (> iOS 13)
    ///
    static var listForeground: UIColor {
        if #available(iOS 13, *) {
            return .secondarySystemGroupedBackground
        }
        
        return .white
    }
}

// MARK: - Login.
extension UIColor {
    class var alertHeaderImageBackgroundColor: UIColor {
        return UIColor(light: .systemColor(.systemGray6),
                       dark: .systemColor(.systemGray5))
    }
    
    /// The background color of the authentication prologue bottom area & button container.
    ///
    static var authPrologueBottomBackgroundColor: UIColor {
        return .withColorStudio(.brand, shade: .shade80)
    }
}

// MARK: - Grays
extension UIColor {
    /// Muriel gray palette
    /// - Parameter shade: a MurielColorShade of the desired shade of gray
    class func gray(_ shade: ColorStudioShade) -> UIColor {
        return .withColorStudio(.gray, shade: shade)
    }
    
    /// Muriel neutral colors, which invert in dark mode
    /// - Parameter shade: a MurielColorShade of the desired neutral shade
    class func neutral(_ shade: ColorStudioShade) -> UIColor {
        switch shade {
        case .shade0:
            return UIColor(light: .withColorStudio(.gray, shade: .shade0), dark: .withColorStudio(.gray, shade: .shade100))
        case .shade5:
            return UIColor(light: .withColorStudio(.gray, shade: .shade5), dark: .withColorStudio(.gray, shade: .shade90))
        case .shade10:
            return UIColor(light: .withColorStudio(.gray, shade: .shade10), dark: .withColorStudio(.gray, shade: .shade80))
        case .shade20:
            return UIColor(light: .withColorStudio(.gray, shade: .shade20), dark: .withColorStudio(.gray, shade: .shade70))
        case .shade30:
            return UIColor(light: .withColorStudio(.gray, shade: .shade30), dark: .withColorStudio(.gray, shade: .shade60))
        case .shade40:
            return UIColor(light: .withColorStudio(.gray, shade: .shade40), dark: .withColorStudio(.gray, shade: .shade50))
        case .shade50:
            return UIColor(light: .withColorStudio(.gray, shade: .shade50), dark: .withColorStudio(.gray, shade: .shade40))
        case .shade60:
            return UIColor(light: .withColorStudio(.gray, shade: .shade60), dark: .withColorStudio(.gray, shade: .shade30))
        case .shade70:
            return UIColor(light: .withColorStudio(.gray, shade: .shade70), dark: .withColorStudio(.gray, shade: .shade20))
        case .shade80:
            return UIColor(light: .withColorStudio(.gray, shade: .shade80), dark: .withColorStudio(.gray, shade: .shade10))
        case .shade90:
            return UIColor(light: .withColorStudio(.gray, shade: .shade90), dark: .withColorStudio(.gray, shade: .shade5))
        case .shade100:
            return UIColor(light: .withColorStudio(.gray, shade: .shade100), dark: .withColorStudio(.gray, shade: .shade0))
        }
    }
}
