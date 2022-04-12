//
//  FavoritesViewController.swift
//  MoviesHome
//
//  Created by Amr Hesham on 12/04/2022.
//

import UIKit

class FavoritesViewController: BaseViewController {
    
    // MARK: - Properties
    weak var coordinator: AppCoordinator?
    var favoritesViewModel: FavoritesViewModel = FavoritesViewModel()
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds)
        tableView.backgroundColor = .appBackground()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        //        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: ViewController Lifecycle
    override func loadView() {
        view = UIView()
        view.backgroundColor = .appBackground()
        navigationItem.title = Strings.favoritesDBTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindOnViewModel(favoritesViewModel)
        bindLoadingState(to: favoritesViewModel)
        bindErrorState(to: favoritesViewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritesViewModel.getFavorites()
    }
    
    private func setupViews() {
        configureTableView()
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.pinEdgesToSuperview()
        //        tableView.registerCell(GenericCollectionViewCell<MovieCardView>.self)
        //        collectionView.register(FooterView.self, ofKind: UICollectionView.elementKindSectionFooter)
    }
    
    
}


extension FavoritesViewController {
    func bindOnViewModel(_ viewModel: FavoritesViewModel) {
        viewModel.favoritesSubject.subscribe { [weak self] favorites in
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
}
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritesViewModel.moviesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel?.text = favoritesViewModel.movieAt(indexPath.row)?.title
        return cell
    }
}
