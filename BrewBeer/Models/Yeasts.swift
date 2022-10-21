//
//  Yeasts.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 19/10/22.
//

import Foundation

struct Yeasts : Decodable {
    let company: String
    let name: String
    let id: String
    let min_attenuation: Int?
    let max_attenuation: Int?
    let attenuation_level: String?
    let flocculation: String?
    let min_temp: Min_temp
    let max_temp: Max_temp
    let alc_tolerance: Int?
    let alc_tolerance_level: String?
}

struct Min_temp: Decodable {
        let fahrenheit: Double
        let kelvin: Double
        let celsius: Double
        let rankine: Double
}

struct Max_temp: Decodable {
        let fahrenheit: Double
        let kelvin: Double
        let celsius: Double
        let rankine: Double
}
