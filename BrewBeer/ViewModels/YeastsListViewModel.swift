//
//  YeastsListViewModel.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 20/10/22.
//

import Foundation

class YeastsListViewModel {
    
    private(set) var yeasts: [YeastsViewModel] = []
    
    func populateYeasts(url: URL) async {
        do {
            let yeasts =  try await WebService().getYeasts(url: url)
            self.yeasts = yeasts.map(YeastsViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct YeastsViewModel {
    private let yeasts: Yeasts
    
    init(yeasts: Yeasts) {
        self.yeasts = yeasts
    }
    
    var name: String {
        yeasts.name
    }
}
