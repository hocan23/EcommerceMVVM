//
//  HomeView.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeVC: BaseVC {
    private let viewModel = HomeVM()
    
    private var collectionView: CollectionView<Product, ProductCell>?
    private var horizontalCollectionView: CollectionView<Product, ProductCell>?
    
    var errorView: ErrorView = ErrorView()
    
    lazy var refreshController: UIRefreshControl = {
        let refreshController = UIRefreshControl()
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        return refreshController
    }()
    
    private var products: [Product] = []
    private var filteredProducts: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        initTabBarBadge()
        bind()
        setupCartBadgeObserver()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        prepareErrorView()
    }
    
    func setupCartBadgeObserver() {
    }
    
    @objc private func updateCartBadge() {
        initTabBarBadge()
    }
    
    private func initTabBarBadge() {

    }
    
    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(errorView)
        errorView.centerX(to: view)
        errorView.centerY(to: view)
        
        horizontalCollectionView = CollectionView<Product, ProductCell>(
            cellClass: ProductCell.self,
            itemSize: CGSize(width: (view.frame.width - 48) / 2, height: 300),
            scrollDirection: .horizontal,
            configureCell: { cell, product in
                cell.configure(with: product)
            }
        )
        
        collectionView = CollectionView<Product, ProductCell>(
            cellClass: ProductCell.self,
            itemSize: CGSize(width: (view.frame.width - 48) / 2, height: 300),
            configureCell: { cell, product in
                cell.configure(with: product)
            }
        )
        
        collectionView?.didSelectItem = { [weak self] product in
            Router.navigate(to: .productDetail(product: product), from: self?.navigationController)
        }
        
        if let horizontalCollectionView = horizontalCollectionView {
            horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(horizontalCollectionView)
            NSLayoutConstraint.activate([
                horizontalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                horizontalCollectionView.heightAnchor.constraint(equalToConstant: 300)
            ])

        }
        
        if let collectionView = collectionView {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: horizontalCollectionView!.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])

        }
        

    }
    
    @objc func pullToRefresh() {
        //presenter?.pullToRefresh()
    }
    
    private func prepareErrorView() {
        errorView.retryButtonTapped = errorButtonOnTapped
        errorView.setMessage("An error occurred")
    }
    
    private func errorButtonOnTapped() {
        //presenter?.viewDidLoad()
    }
    
    private func collectionViewDisplay() {
        guard let collectionView else { return }
        collectionView.willDisplayCell = { [weak self] cell, indexPath in
            //self?.presenter?.viewWillDisplay()
        }
    }
}

// MARK: Bindings.
private extension HomeVC {
    func bind() {
        bindProducts()
    }
    
    func bindProducts() {
        viewModel.filteredProducts
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] products in
                guard let self else { return }
                if let products = products {
                    collectionView?.isHidden = false
                    errorView.isHidden = true
                    collectionView?.updateItems(products)
                    horizontalCollectionView?.updateItems(products)
                } else {
                    collectionView?.isHidden = false
                    errorView.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        bindLoadingStatus(to: viewModel.loadingStatus)
    }
}
