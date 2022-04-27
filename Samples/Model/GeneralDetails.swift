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
    let rating: Double
    let artworkURL: URL
    let sellerName: String
    
    enum CodingKeys: String, CodingKey {
        case name = "trackCensoredName"
        case rating = "averageUserRatingForCurrentVersion"
        case artworkURL = "artworkUrl60"
        case sellerName
    }
}

extension GeneralDetails: CustomStringConvertible {
    var description: String {
        return """
        \n\n name: \(name)
        \t rating: \(Int(rating))
        \t sellerName: \(sellerName)
        """
    }
}


extension SearchResults: CustomStringConvertible {
    var description: String {
        return "\(resultCount) results \n \(results)\n"
    }
}
