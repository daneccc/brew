//
//  StyleDetailViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 17/10/22.
//

import UIKit

class HopsDetailViewController: UIViewController {
    
    var name: String
    var descriptionHops: String
    let country: String

    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        return descriptionLabel
    }()
    
    let countryLabel: UILabel = {
        let countryLabel = UILabel()
        return countryLabel
    }()

    internal init(data: HopsViewModel) {
        
        self.name = data.name
        self.descriptionHops = data.description
        self.country = data.country

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
            fatalError("oi")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        title = name

        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Description: \n\(descriptionHops)"
        //descriptionLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        view.backgroundColor = .systemYellow
        
        countryLabel.text = "Country: \(country)"
        
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(countryLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            countryLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 20),
            countryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            countryLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
    }
}
