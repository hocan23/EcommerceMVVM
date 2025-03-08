//
//  HomeVM.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

import Foundation
import RxSwift
import RxCocoa

class HomeVM {
    private let disposeBag = DisposeBag()
    private let networkManager: NetworkManagerProtocol
    let loadingStatus = BehaviorRelay<LoadingStatus>(value: .initial)
    let products = BehaviorRelay<[Product]?>(value: nil)
    let horizontalProducts = BehaviorRelay<[Product]?>(value: nil)
    
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        fetchProducts()
    }
    
    func fetchProducts() {
        loadingStatus.accept(.loading)
        networkManager.request(
            path: NetworkPaths.products.rawValue,
            method: .get,
            headers: nil,
            parameters: nil,
            responseType: [Product].self
        ) { [weak self] result in
            switch result {
            case .success(let products):
                self?.products.accept(products)
                self?.loadingStatus.accept(.success)
            case .failure(let error):
                self?.loadingStatus.accept(.error(error.localizedDescription))
                self?.products.accept(nil)
            }
        }
        
        networkManager.request(
            path: NetworkPaths.horizontalProducts.rawValue,
            method: .get,
            headers: nil,
            parameters: nil,
            responseType: [Product].self
        ) { [weak self] result in
            switch result {
            case .success(let products):
                self?.horizontalProducts.accept(products)
                self?.loadingStatus.accept(.success)
            case .failure(let error):
                self?.loadingStatus.accept(.error(error.localizedDescription))
                self?.horizontalProducts.accept(nil)
            }
        }
    }

}
