//
//  ViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 11/10/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ListViewController())
        let vc3 = UINavigationController(rootViewController: CalculatorViewController())
        let vc4 = UINavigationController(rootViewController: FavoritesViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "list.dash")
        vc3.tabBarItem.image = UIImage(systemName: "square.and.pencil")
        vc4.tabBarItem.image = UIImage(systemName: "heart")
        
        vc1.title = "Home"
        vc2.title = "List"
        vc3.title = "Calculator"
        vc4.title = "Favorites"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)

    }
}
