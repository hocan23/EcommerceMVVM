//
//  TabbarController.swift
//  EcommerceMVVM
//
//  Created by hasancan on 8.03.2025.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        configureTabBar()
    }
    
    private func setupTabs() {
        let home = UINavigationController(rootViewController: HomeVC())
        
        home.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        setViewControllers([home], animated: true)
        selectedIndex = 0
    }
    
    private func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = .systemBlue
    }
}
