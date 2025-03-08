//
//  Router.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

import UIKit

class Router {
    static func navigate(to route: RoutingEnum, from navigationController: UINavigationController?) {
        guard let navigationController = navigationController else {
            print("NavigationController bulunamadı.")
            return
        }
        
        let viewController = instantiateViewController(forRoute: route)
        
        if let configurableVC = viewController as? RoutingConfiguration {
            configurableVC.configure(with: route)
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private static func instantiateViewController(forRoute route: RoutingEnum) -> UIViewController {
        let caseName = String(describing: route)
        let cleanCaseName = caseName.components(separatedBy: "(").first ?? caseName
        let viewControllerName = cleanCaseName.prefix(1).uppercased() + cleanCaseName.dropFirst() + "VC"
        guard let viewControllerType = NSClassFromString("\(Bundle.main.namespace).\(viewControllerName)") as? UIViewController.Type else {
            fatalError("ViewController '\(viewControllerName)' bulunamadı.")
        }
        return viewControllerType.init()
    }
}
