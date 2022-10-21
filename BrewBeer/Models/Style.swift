//
//  Style.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 14/10/22.
//

import Foundation

struct Style : Decodable {
    let name: String
    let original_gravity_min: Double
    let original_gravity_max: Double
    let final_gravity_min: Double
    let final_gravity_max: Double
    let abv_min: Double
    let abv_max: Double
    let ibu_min: Double
    let ibu_max: Double
    let color_srm_min: Double
    let color_srm_max: Double
    let description: String
}
