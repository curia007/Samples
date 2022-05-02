//
//  ServiceDetails.swift
//  GeneralSearch
//
//  Created by Carmelo Uria on 4/26/22.
//

import Foundation

struct SearchResults: Codable {
    let resultCount: Int
    let results: [ServiceDetail]
}

struct ServiceDetail: Codable, Identifiable {
    let id = UUID()
    let name: String
    var price: Float?
    let artworkURL: URL
    let largeArtworkURL : URL
    var previewURL : URL?
    let artistName: String
    let kind: String
    let itemDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case price = "collectionPrice"
        case artworkURL = "artworkUrl60"
        case largeArtworkURL = "artworkUrl100"
        case previewURL = "previewUrl"
        case kind = "kind"
        case itemDescription = "longDescription"
        case artistName 
    }
}

extension ServiceDetail: CustomStringConvertible {
    var description: String {
        return """
        \n\n name: \(name)
        \t price: \(Float(price ?? 0.0))
        \t artistName: \(artistName)
        """
    }
}


extension SearchResults: CustomStringConvertible {
    var description: String {
        return "\(resultCount) results \n \(results)\n"
    }
}
