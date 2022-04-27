//
//  GeneralDetails.swift
//  GeneralSearch
//
//  Created by Carmelo Uria on 4/26/22.
//

import Foundation

struct SearchResults: Codable {
    let resultCount: Int
    let results: [GeneralDetails]
}

struct GeneralDetails: Codable, Identifiable {
    let id = UUID()
    let name: String
    let price: Float
    let artworkURL: URL
    let artistName: String
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case price = "collectionHdPrice"
        case artworkURL = "artworkUrl60"
        case artistName = "artistName"
    }
}

extension GeneralDetails: CustomStringConvertible {
    var description: String {
        return """
        \n\n name: \(name)
        \t price: \(Float(price))
        \t sellerName: \(artistName)
        """
    }
}


extension SearchResults: CustomStringConvertible {
    var description: String {
        return "\(resultCount) results \n \(results)\n"
    }
}
