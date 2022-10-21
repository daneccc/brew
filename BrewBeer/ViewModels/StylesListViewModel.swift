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
}

