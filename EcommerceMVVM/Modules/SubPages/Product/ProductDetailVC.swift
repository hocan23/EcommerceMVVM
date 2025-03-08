//
//  ProductDetailVC.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

import UIKit
import RxSwift
import RxCocoa

final class ProductDetailVC: UIViewController, RoutingConfiguration {
    private let disposeBag = DisposeBag()
    private let viewModel = ProductDetailVM()
    
    // MARK: - UI Components
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        return imageView
    }()

    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .blue
        return label
    }()

    private let addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to Cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = AppColors.primaryColor
        button.layer.cornerRadius = 4
        button.titleLabel?.font = AppFonts.boldLarge
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        addToCartButton.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
    }
    
    func configure(with route: RoutingEnum) {
        if case .productDetail(let product) = route {
            viewModel.product.accept(product)
            displayProductDetails(product: product)
        }
    }

    private func setupUI() {
        view.addSubview(productImageView)
        view.addSubview(favoriteButton)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.addSubview(addToCartButton)

        // Constraints
        productImageView.pinToTop(of: view, offset: 16)
        productImageView.pinToLeading(of: view, offset: 16)
        productImageView.pinToTrailing(of: view, offset: -16)
        
        productImageView.setSize(height: 200)

        favoriteButton.pinToTop(of: productImageView, offset: 8)
        favoriteButton.pinToTrailing(of: productImageView, offset: -8)
        favoriteButton.setSize(width: 24, height: 24)

        nameLabel.pinTopToBottom(of: productImageView, offset: 16)
        nameLabel.pinToLeading(of: view, offset: 16)
        nameLabel.pinToTrailing(of: view, offset: 16)

        descriptionLabel.pinTopToBottom(of: nameLabel, offset: 8)
        descriptionLabel.pinToLeading(of: view, offset: 16)
        descriptionLabel.pinToTrailing(of: view, offset: -16)

        priceLabel.pinToBottom(of: view, offset: -16)
        priceLabel.pinToLeading(of: view, offset: 16)

        addToCartButton.pinToBottom(of: view, offset: -16)
        addToCartButton.pinToTrailing(of: view, offset: -16)
        addToCartButton.setSize(width: 180, height: 44)
    }

    // MARK: - Actions

    @objc private func addToCartTapped() {
        guard let product = viewModel.product.value else { return }
    }
}

extension ProductDetailVC {
    func displayProductDetails(product: Product) {

    }
}
