//
//  CartLoadingView.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

import UIKit

class CartLoadingView: UIView {
    private let cartImageView = UIImageView()
    private let spinningItemView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        startLoadingAnimation()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        startLoadingAnimation()
    }
    
    private func setupUI() {
        // Sepet Görseli
        cartImageView.image = UIImage(systemName: "cart.fill")
        cartImageView.tintColor = .systemBlue
        cartImageView.contentMode = .scaleAspectFit
        cartImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cartImageView)
        
        // Dönen Ürün Görseli
        spinningItemView.image = UIImage(systemName: "bag.fill")
        spinningItemView.tintColor = .systemRed
        spinningItemView.contentMode = .scaleAspectFit
        spinningItemView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinningItemView)
        
        // Layout Ayarları
        NSLayoutConstraint.activate([
            cartImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cartImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cartImageView.widthAnchor.constraint(equalToConstant: 60),
            cartImageView.heightAnchor.constraint(equalToConstant: 60),
            
            spinningItemView.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinningItemView.bottomAnchor.constraint(equalTo: cartImageView.topAnchor, constant: -20),
            spinningItemView.widthAnchor.constraint(equalToConstant: 40),
            spinningItemView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func startLoadingAnimation() {
        // Ürün Döndürme Animasyonu
        let spinAnimation = CABasicAnimation(keyPath: "transform.rotation")
        spinAnimation.fromValue = 0
        spinAnimation.toValue = CGFloat.pi * 2
        spinAnimation.duration = 1.0
        spinAnimation.repeatCount = .infinity
        spinningItemView.layer.add(spinAnimation, forKey: "spinAnimation")
        
        // Ürün Yukarı Aşağı Hareketi
        let moveUpDown = CABasicAnimation(keyPath: "position.y")
        moveUpDown.fromValue = spinningItemView.layer.position.y
        moveUpDown.toValue = spinningItemView.layer.position.y - 20
        moveUpDown.duration = 0.5
        moveUpDown.autoreverses = true
        moveUpDown.repeatCount = .infinity
        spinningItemView.layer.add(moveUpDown, forKey: "moveUpDownAnimation")
    }
    
    func stopLoadingAnimation() {
        spinningItemView.layer.removeAllAnimations()
    }
}
