//
//  StylesListViewModel.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 14/10/22.
//

import Foundation

class StylesListViewModel {
    
    private(set) var styles: [StylesViewModel] = []
    
    func populateStyles(url: URL) async {
        do {
            let styles =  try await WebService().getStyles(url: url)
            self.styles = styles.map(StylesViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct StylesViewModel {
    private let style: Style
    
    init(style: Style) {
        self.style = style
    }
    
    var name: String {
        style.name
    }
    
    var original_gravity_min: Double {
        style.original_gravity_min
    }
    
    var description: String {
        style.description
    }
    
    var original_gravity_max: Double {
        style.original_gravity_max
    }
    
    var final_gravity_min: Double {
        style.final_gravity_min
    }
    
    var final_gravity_max: Double {
        style.final_gravity_max
    }
    
    var abv_min: Double {
        style.abv_min
    }
    
    var abv_max: Double {
        style.abv_max
    }
    
    var ibu_min: Double {
        style.ibu_min
    }
    
    var ibu_max: Double {
        style.ibu_max
    }
    
    var color_srm_min: Double {
        style.color_srm_min
    }
    
    var color_srm_max: Double {
        style.color_srm_max
    }
}
