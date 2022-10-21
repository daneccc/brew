//
//  WebService.swift
//  BrewBeer
//
//  Created by Daniele Cavalcante on 14/10/22.
//

import Foundation

enum dataError: Error {
    case invalidServerResponse
}

class WebService {
    
    func getStyles(url: URL) async throws -> [Style] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw dataError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([Style].self, from: data)
    }
    
    func getHops(url: URL) async throws -> [Hops] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw dataError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([Hops].self, from: data)
    }
    
    func getYeasts(url: URL) async throws -> [Yeasts] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw dataError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([Yeasts].self, from: data)
    }
}


