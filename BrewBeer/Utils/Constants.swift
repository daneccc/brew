//
//  Constants.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 14/10/22.
//

import Foundation

struct Constants {
    
    struct URLs {
        static let baseURL = "https://rustybeer.herokuapp.com"
        
        static let allStyles = URL(string: "\(baseURL)/styles")!
        static let allHops = URL(string: "\(baseURL)/hops")!
        static let allYeasts = URL(string: "\(baseURL)/yeasts")!
    }
}
