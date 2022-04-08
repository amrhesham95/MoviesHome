//
//  ViewController.swift
//  MoviesHome
//
//  Created by Amr Hesham on 07/04/2022.
//

import UIKit

final class MoviesHomeViewController: BaseViewController {
    
    var moviesViewModel: MoviesHomeViewModel = MoviesHomeViewModel()
    
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let spacing = Constants.defaultSpacing
        let itemWidth: CGFloat = (UIScreen.main.bounds.width - (Constants.numberOfColumns - spacing) - 2) / Constants.numberOfColumns
        let itemHeight: CGFloat = (itemWidth - Constants.defaultPadding*2) * 1.5 + 67
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .appBackground()
        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    //MARK: ViewController Lifecycle
    override func loadView() {
        view = UIView()
        view.backgroundColor = .appBackground()
        navigationItem.title = Strings.moviesDBTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindOnViewModel(moviesViewModel)
        bindLoadingState(to: moviesViewModel)
        bindErrorState(to: moviesViewModel)
        moviesViewModel.viewDidLoad()
    }
    
    private func setupViews() {
        configureCollectionView()
        configureNavBarButtons()
    }
    
    private func configureNavBarButtons() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(with: .SEARCH),
//                                             style: .plain, target: self,action: #selector(tappedSearch))
    }
    
    //MARK: ConfigureCollectionView
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.pinEdgesToSuperview()
        collectionView.registerCell(GenericCollectionViewCell<MovieCardView>.self)
//        collectionView.register(FooterView.self, ofKind: UICollectionView.elementKindSectionFooter)
    }
    
    @objc func tappedSearch() {
//        presenter.tappedOnSearch()
    }
}

extension MoviesHomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesViewModel.moviesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: GenericCollectionViewCell<MovieCardView> = collectionView.dequeue(at: indexPath)
        let cardView = MovieCardView(frame: .zero)
        cell.cellView = cardView
        cell.cellView?.movie = moviesViewModel.movieAt(indexPath.item)
        cell.backgroundColor = .green
        return cell
    }
    
}

private extension MoviesHomeViewController {
    func bindOnViewModel(_ viewModel: MoviesHomeViewModel) {
        viewModel.moviesSubject.subscribe { [weak self] _ in
            self?.collectionView.reloadData()
        }.disposed(by: disposeBag)
    }
}
