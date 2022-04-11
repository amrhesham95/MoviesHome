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
        collectionView.delegate = self
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
        moviesViewModel.getMovies()
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
        
        let imageWidth = collectionViewLayout.itemSize.width
        let imageSize = CGSize(width: imageWidth, height: imageWidth*1.5)
        if let imageURL = moviesViewModel.posterURL(indexPath.item) {
            cell.cellView?.configure(imageURL: imageURL, size: imageSize, indexPath: indexPath)
        }
        return cell
    }
}

extension MoviesHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        loadMoreMoviesIfNeeded(indexPath: indexPath)
    }
}

private extension MoviesHomeViewController {
    func loadMoreMoviesIfNeeded(indexPath: IndexPath) {
        guard moviesViewModel.state.value != .loading, indexPath.row == (moviesViewModel.moviesCount - 1) else {
            return
        }
        moviesViewModel.getMovies()
    }
    func bindOnViewModel(_ viewModel: MoviesHomeViewModel) {
        viewModel.moviesSubject.subscribe { [weak self] movies, indexPaths in
            if indexPaths.isEmpty {
                self?.collectionView.reloadData()
            } else {
                self?.collectionView.performBatchUpdates({ [weak self] in
                    guard let self = self else { return }
                    self.collectionView.insertItems(at: indexPaths)
                })
            }
        }.disposed(by: disposeBag)
    }
}
