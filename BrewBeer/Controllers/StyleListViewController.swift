//
//  StyleListViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 14/10/22.
//

import UIKit

class StyleListViewController: UITableViewController {
    
    private let vm = StylesListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        configureUI()
        Task {
            await populateStyles()
        }
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Styles"
        tableView.register(StyleCell.self, forCellReuseIdentifier: "StyleCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.styles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StyleCell", for: indexPath) as? StyleCell else {
            fatalError("StyleCell is not defined")
        }
        let style = vm.styles[indexPath.row]
        cell.configure(style)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = StyleDetailViewController(data: vm.styles[indexPath.row])
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func populateStyles() async {
        await vm.populateStyles(url: Constants.URLs.allStyles)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        // print(vm.styles)
    }
}
