//
//  StyleDetailViewController.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 17/10/22.
//

import UIKit

class StyleDetailViewController: UIViewController {
    
    var styleName: String
    var styleDescription: String
    var original_gravity_min: Double
    var original_gravity_max: Double
    var final_gravity_min: Double
    var final_gravity_max: Double
    var abv_min: Double
    var abv_max: Double
    var ibu_min: Double
    var ibu_max: Double
    var color_srm_min: Double
    var color_srm_max: Double
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        return descriptionLabel
    }()
    
    let numberLabel: UILabel = {
        let numberLabel = UILabel()
        return numberLabel
    }()

    internal init(data: StylesViewModel) {
        
        self.styleName = data.name
        self.styleDescription = data.description
        self.original_gravity_min = data.original_gravity_min
        self.original_gravity_max = data.original_gravity_min
        self.final_gravity_max = data.final_gravity_max
        self.final_gravity_min = data.final_gravity_min
        self.abv_max = data.abv_max
        self.abv_min = data.abv_min
        self.ibu_min = data.ibu_min
        self.ibu_max = data.ibu_max
        self.color_srm_min = data.color_srm_min
        self.color_srm_max = data.color_srm_max

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
        view.backgroundColor = .systemYellow
        title = styleName
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Description of the beer style: \n\(styleDescription)"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        numberLabel.text = "Original gravity min \(original_gravity_min)"
        numberLabel.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(descriptionLabel)
        self.view.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            numberLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 20),
            numberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            numberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
    }
}
