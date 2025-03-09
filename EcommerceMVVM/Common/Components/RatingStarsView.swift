//
//  Untitled.swift
//  EcommerceMVVM
//
//  Created by hasancan on 9.03.2025.
//

import UIKit

class RatingStarsView: UIStackView {
    
    var rating: Double = 0 {
        didSet {
            updateStars()
        }
    }
    
    private var starImageViews: [UIImageView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStars()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStars()
    }
    
    private func setupStars() {
        axis = .horizontal
        spacing = 5
        distribution = .fillEqually
        
        for _ in 0..<5 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "star")
            imageView.tintColor = .gray
            starImageViews.append(imageView)
            addArrangedSubview(imageView)
        }
    }
    
    private func updateStars() {
        let roundedRating = Int(rating.rounded())
        
        for (index, imageView) in starImageViews.enumerated() {
            if index < roundedRating {
                imageView.image = UIImage(systemName: "star.fill")
                imageView.tintColor = UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 1.0)
            } else {
                imageView.image = UIImage(systemName: "star")
                imageView.tintColor = .gray
            }
        }
    }
}
