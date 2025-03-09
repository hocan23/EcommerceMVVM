//
//  RoutingEnum.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

protocol RoutingConfiguration {
    func configure(with route: RoutingEnum)
}

enum RoutingEnum {
    case home
    case productDetail(product: Product)
}
