//
//  Array+.swift
//  ECommerce
//
//  Created by hasancan on 8.03.2025.
//

import Foundation

public extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Array where Element: Equatable {
    func unique() -> [Element] {
        var uniqueArray: [Element] = []

        forEach { item in
            guard !uniqueArray.contains(where: { $0 == item }) else { return }
            uniqueArray.append(item)
        }

        return uniqueArray
    }
}
