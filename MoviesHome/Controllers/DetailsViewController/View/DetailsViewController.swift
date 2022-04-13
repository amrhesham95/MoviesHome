//
//  DetailsViewController.swift
//  MoviesHome
//
//  Created by Amr Hesham on 12/04/2022.
//

import UIKit
class DetailsViewController: BaseViewController {
    
    // MARK: - Properties
    let movieImageURL: URL?
    let movieDescription: String
    let movieTitle: String
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    lazy var imageView: UIImageView = {
        let imageViewframe = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.frame.height*0.025)
        let imageView = UIImageView(frame: imageViewframe)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = movieDescription
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 15.0)
        label.textAlignment = NSTextAlignment.natural
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(movieImageURL: URL?, movieDescription: String, movieTitle: String) {
        self.movieImageURL = movieImageURL
        self.movieDescription = movieDescription
        self.movieTitle = movieTitle
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ViewController Lifecycle
    override func loadView() {
        view = UIView()
        view.backgroundColor = .appBackground()
        navigationItem.title = movieTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        configureSubviews()
        setupConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(movieDescriptionLabel)
        
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: view.frame.width),
//            imageView.heightAnchor.constraint(equalToConstant: view.frame.height*0.25)
        ])
        
        NSLayoutConstraint.activate([
            movieDescriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            movieDescriptionLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor),
            movieDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieDescriptionLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor)
        ])
    }
    
    private func setupViews() {
        configureTableView()
    }
    
    
    private func configureTableView() {
        if let imageURL = movieImageURL {
            configure(imageURL: imageURL)
        }
//        view.addSubview(imageView)
//        view.addSubview(movieDescriptionLabel)
//        imageView.pinEdgesToSuperview()
//        movieDescriptionLabel.pin(toView: imageView, attributes: [
//            NSLayoutConstraint.Attribute.leading,
//            NSLayoutConstraint.Attribute.bottom
//        ])
    }
    
    func configure(imageURL: URL) {
        imageView.sd_setImage(with: imageURL, completed: nil)
    }
}
