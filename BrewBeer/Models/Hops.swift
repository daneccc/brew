//
//  Hops.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 19/10/22.
//

import Foundation

struct Hops : Decodable {
    let name: String
    let alpha_acid_min: Double
    let alpha_acid_max: Double
    let beta_acid_min: Double
    let beta_acid_max: Double
    let purpose: [String] // array
    let country: String
    let description: String
    let substitutions: [String] // array
}
