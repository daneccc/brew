//
//  ViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 11/10/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
//    let segmentedControl: UISegmentedControl = {
//        let sc = UISegmentedControl(items: ["Styles", "Hops", "Yeasts"])
//        return sc
//    }()
    
//    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = UIColor.white

        view.backgroundColor = .systemOrange
//        title = "Brew Beer"
        
//        let stackView = UIStackView(arrangedSubviews: [
//        segmentedControl, tableView
//        ])
//        stackView.axis = .vertical
        
//        view.addSubview(stackView)
        
        let vc1 = UINavigationController(rootViewController: StyleListViewController())
        let vc2 = UINavigationController(rootViewController: HopsListViewController())
        let vc3 = UINavigationController(rootViewController: YeastsListViewController())
        let vc4 = UINavigationController(rootViewController: CalculatorViewController())
//        let vc3 = UINavigationController(rootViewController: FavoritesViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc2.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc3.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc4.tabBarItem.image = UIImage(systemName: "plus.forwardslash.minus")

        
        vc1.title = "Styles"
        vc2.title = "Hops"
        vc3.title = "Yeasts"
        vc4.title = "Calculator"

        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)

    }
}
