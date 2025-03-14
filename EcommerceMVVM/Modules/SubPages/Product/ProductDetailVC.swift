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
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        return stackView
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
    
    private let ratingView: RatingStarsView = {
        let ratingView = RatingStarsView()
        ratingView.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        return ratingView
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func configure(with route: RoutingEnum) {
        if case .productDetail(let product) = route {
            viewModel.product.accept(product)
            displayProductDetails(product: product)
        }
    }

    private func setupUI() {
        topStackView.addArrangedSubview(ratingView)
        topStackView.addArrangedSubview(productImageView)
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(descriptionLabel)
        topStackView.addArrangedSubview(priceLabel)
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topStackView)
        // Constraints

        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        productImageView.setSize(height: 200)



    }

}

extension ProductDetailVC {
    func displayProductDetails(product: Product) {
        self.ratingView.rating = product.rating?.rate ?? 0
        self.descriptionLabel.text = product.description
        self.titleLabel.text = product.title
        self.priceLabel.text = "$\(product.price ?? 0)"
        productImageView.kf.setImage(with: URL(string: product.image ?? ""), placeholder: UIImage(named: "placeholder"))
    }
}
