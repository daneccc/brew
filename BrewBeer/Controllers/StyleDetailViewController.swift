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
    var num: Double
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        return descriptionLabel
    }()

    internal init(data: StylesViewModel) {
        
        self.styleName = data.name
        self.styleDescription = data.description
        self.num = data.original_gravity_min
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
            fatalError("oi")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemYellow
        
        configure()
        configCardView()
//        title = styleName
//        let descriptionLabel = UILabel(frame: CGRect(x: 0, y: 400, width: 200, height: 21))
//        descriptionLabel.center = CGPoint(x: 160, y: 400)
//        descriptionLabel.textAlignment = .center
//        descriptionLabel.text = styleDescription
        
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        numberLabel.center = CGPoint(x: 160, y: 285)
        numberLabel.textAlignment = .center
        numberLabel.text = "\(num)"
        

        // self.view.addSubview(descriptionLabel)
        self.view.addSubview(numberLabel)
    }
    
    
    func configure() {
        title = styleName

        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "\(styleDescription)"
        view.backgroundColor = .systemYellow
        
        self.view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
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
