//
//  PopupShowable.swift
//  Scorp-Case
//
//  Created by hasancan on 8.03.2025.
//

import UIKit

protocol PopupShowable where Self: UIViewController {
    func showPopup(title: String, message: String)
}

extension PopupShowable {
    func showPopup(title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
