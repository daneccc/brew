//
//  YeastsViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 20/10/22.
//

import Foundation
import UIKit

class YeastsListViewController: UITableViewController {
    
    private let vm = YeastsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        configureUI()
        Task {
            await populateYeasts()
        }
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Yeasts"
        tableView.register(YeastsCell.self, forCellReuseIdentifier: "YeastsCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.yeasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "YeastsCell", for: indexPath) as? YeastsCell else {
            fatalError("YeastsCell is not defined")
        }
        let yeasts = vm.yeasts[indexPath.row]
        cell.configure(yeasts)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = YeastsDetailViewController(data: vm.yeasts[indexPath.row])
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func populateYeasts() async {
        await vm.populateYeasts(url: Constants.URLs.allYeasts)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
