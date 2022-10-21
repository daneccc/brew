//
//  HopsListViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 19/10/22.
//

import UIKit

class HopsListViewController: UITableViewController {

    private let vm = HopsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        configureUI()
        Task {
            await populateHops()
        }
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Hops"
        tableView.register(HopsCell.self, forCellReuseIdentifier: "HopsCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.hops.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HopsCell", for: indexPath) as? HopsCell else {
            fatalError("HopsCell is not defined")
        }
        let hops = vm.hops[indexPath.row]
        cell.configure(hops)
        
        return cell
        
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextViewController = StyleDetailViewController(data: vm.hops[indexPath.row])
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//    }
    
    private func populateHops() async {
        await vm.populateHops(url: Constants.URLs.allHops)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        // print(vm.styles)
    }
}




