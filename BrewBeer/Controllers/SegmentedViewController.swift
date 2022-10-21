//
//  SegmentedViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 19/10/22.
//

import Foundation
import UIKit

class SegmentedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let vm = StylesListViewModel()
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.styles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "aaaaa"
        return cell
    }
    
    
    
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Styles", "Hops", "Yeasts"])
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let styles = ["style 01", "style 02", "style 03"]
    let hops = ["hops 01", "hops 02", "hops 03"]
    let yeasts = ["yeasts 01", "yeasts 02", "yeasts 03"]
    
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let table = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Brew Beer"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let stackView = UIStackView(arrangedSubviews: [
            segmentedControl, tableView
        ])
        stackView.axis = .vertical
        
        tableView.dataSource = StyleListViewController().tableView.dataSource
        tableView.delegate = StyleListViewController().tableView.delegate
        
        
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        
    }
    
}
