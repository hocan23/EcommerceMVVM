//
//  Bundle+Routing.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

import Foundation

extension Bundle {
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
