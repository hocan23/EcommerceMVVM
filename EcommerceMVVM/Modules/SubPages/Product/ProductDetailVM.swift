//
//  ProductDetailVM.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

import Foundation
import RxSwift
import RxCocoa

final class ProductDetailVM {
    private let disposeBag = DisposeBag()
    let product = BehaviorRelay<Product?>(value: nil)
    
}
