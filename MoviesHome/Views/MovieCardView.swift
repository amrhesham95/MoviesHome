//
//  MovieCardView.swift
//  MoviesHome
//
//  Created by Amr Hesham on 07/04/2022.
//

import UIKit
import SDWebImage

class MovieCardView: UIView {
    
    // MARK: - Properties
    var buttonAction: (() -> Void)?

    // MARK: View Properties
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .appBlack()
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(with: .MEDIUM, of: .SUB_TITLE)
        return titleLabel
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "e")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.setTitle("Favorite", for: .normal)
        favoriteButton.setTitleColor(.appWhite(), for: .normal)
        favoriteButton.backgroundColor = UIColor(hex: APP_COLOR.THEME.rawValue)
        favoriteButton.titleLabel?.font = UIFont(with: .MEDIUM, of: .SUB_TITLE)
        return favoriteButton
    }()
    
    @objc func favoriteButtonClicked() {
        buttonAction?()
    }
    
    // MARK: Data Properties
    var movie : StorageMovie? {
        didSet {
            guard let movie = movie else {
                return
            }
            titleLabel.text = movie.title
        }
    }
    
    // MARK: Init Methods
    init(frame: CGRect, onButtonClicked: @escaping () -> Void) {
        super.init(frame: frame)
        buttonAction = onButtonClicked
        prepareView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
    
    // MARK: Private Custom Methods
    private func prepareView() {
        addSubview(photoImageView)
        photoImageView.pinEdgesEquallyToSuperview(atrributes: [.top, .leading, .trailing], constant: Constants.defaultPadding)
        photoImageView.pin(attribute: .height, toView: photoImageView, toAttribute: .width, multiplier: 1.5, constant: 0)
        photoImageView.giveCorner(radius: Constants.defaultRadius)
        
        addSubview(titleLabel)
        titleLabel.pinTo(atrribute: .top, toView: photoImageView, toAttribute: .bottom, constant: Constants.defaultSpacing)
        titleLabel.pinEdgesEquallyToSuperview(atrributes: [.leading, .trailing], constant: Constants.defaultPadding)
        
        addSubview(favoriteButton)
        favoriteButton.pinTo(atrribute: .top, toView: titleLabel, toAttribute: .bottom, constant: Constants.defaultPadding/2)
        favoriteButton.pinEdgesEquallyToSuperview(atrributes: [.leading, .trailing], constant: Constants.defaultPadding*2)
        favoriteButton.pinEdgesEquallyToSuperview(atrributes: [.bottom], constant: Constants.defaultPadding)
        favoriteButton.giveCorner(radius: Constants.defaultRadius)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
    }
    
    // MARK: Methods
    /// display movies
    /// - Parameters:
    ///   - imageURL: link for image
    ///   - size: size for the image
    ///   - indexPath: indexPath of list
    func configure(imageURL: URL, size: CGSize, indexPath: IndexPath) {
        photoImageView.sd_setImage(with: imageURL, completed: nil)
    }
}

