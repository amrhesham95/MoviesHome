//
//  Font+Helpers.swift
//  MoviesHome
//
//  Created by Amr Hesham on 07/04/2022.
//

import UIKit
extension UIFont {
    convenience init(with name: APP_FONT_STYLE,of size: APP_FONT_SIZE) {
        self.init(name: name.rawValue,size: CGFloat(size.rawValue))!
    }
}
