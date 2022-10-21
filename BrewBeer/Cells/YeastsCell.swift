//
//  YeastsCell.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 20/10/22.
//

import Foundation
import UIKit

class YeastsCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(_ yeasts: YeastsViewModel) {
        
        titleLabel.text = yeasts.name
        contentView.addSubview(titleLabel)
        
        // add constrainsts to the title label
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
}
