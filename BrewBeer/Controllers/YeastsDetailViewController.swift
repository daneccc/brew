//
//  YeastsDetailViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 24/10/22.
//

import Foundation
import UIKit

class YeastsDetailViewController: UIViewController {

    
    var name: String
    var company: String

    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        return descriptionLabel
    }()
    
    let companyLabel: UILabel = {
        let companyLabel = UILabel()
        return companyLabel
    }()

    internal init(data: YeastsViewModel) {
        
        self.name = data.name
        self.company = data.company

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
            fatalError("oi")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        // self.view.addSubview(descriptionLabel)
        // self.view.addSubview(countryLabel)
    }
    
    
    func configure() {
        title = name

        companyLabel.numberOfLines = 0
        companyLabel.text = "Company: \(company)"
        //descriptionLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        view.backgroundColor = .systemYellow
        
//        countryLabel.text = "Country: \(country)"
        
        self.view.addSubview(companyLabel)
//        self.view.addSubview(countryLabel)
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
//        countryLabel.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            companyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            companyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            companyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
//            countryLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 20),
//            countryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            countryLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
        ])
        
    }
        
    func configCardView() {
        self.view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
        ])
    }
}
