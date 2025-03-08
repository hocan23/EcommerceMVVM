//
//  HorizontalProductCell.swift
//  EcommerceMVVM
//
//  Created by Linktera Bilgi Teknolojileri on 8.03.2025.
//

import UIKit
import Kingfisher

class HorizontalProductCell: UICollectionViewCell {
    let appFont = UIFont(name: "Montserrat", size: 14)
    
    // MARK: - UI Components
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regularNormal
        label.textColor = AppColors.primaryColor
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regularNormal
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regularNormal
        label.textColor = AppColors.primaryColor
        return label
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .fill
        return stackView
    }()
    
    private let specStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        return stackView
    }()
    
    // MARK: - Properties

    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        // Shadow
        contentView.backgroundColor = .white
        contentView.applyShadow()
        contentView.layer.cornerRadius = 8
        
        specStackView.addArrangedSubview(titleLabel)
        specStackView.addArrangedSubview(priceLabel)
        specStackView.addArrangedSubview(ratingLabel)
        
        // Add StackView
        contentView.addSubview(topStackView)
        topStackView.pinToSuperviewEdges(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        topStackView.addArrangedSubview(productImageView)
        productImageView.setSize(width: 100, height: 200)
        topStackView.addArrangedSubview(specStackView)
        

        
        // Add views to StackView

        
    }

    
    // MARK: - Configure Cell
    func configure(with product: Product) {
        self.titleLabel.text = product.title
        self.priceLabel.text = "$\(product.price ?? 0)"
        self.ratingLabel.text = "\(product.rating?.count ?? 0)+ takip"
        productImageView.kf.setImage(with: URL(string: product.image ?? ""), placeholder: UIImage(named: "placeholder"))
    }
}
