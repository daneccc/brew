//
//  HopsViewModel.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 19/10/22.
//

import Foundation

class HopsListViewModel {
    
    private(set) var hops: [HopsViewModel] = []
    
    func populateHops(url: URL) async {
        do {
            let hops =  try await WebService().getHops(url: url)
            self.hops = hops.map(HopsViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct HopsViewModel {
    private let hops: Hops
    
    init(hops: Hops) {
        self.hops = hops
    }
    
    var name: String {
        hops.name
    }
    
    var description: String {
        hops.description
    }
    
    var country: String {
        hops.country
    }
}
