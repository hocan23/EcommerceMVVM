//
//  LoadingShowable.swift
//
//
//  Created by hasancan on 8.03.2025.
//

import UIKit

protocol LoadingShowable where Self: UIViewController {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        LoadingView.shared.startLoading()
    }
    
    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
}

enum LoadingStatus {
    case initial
    case loading
    case success
    case error(String)
}
