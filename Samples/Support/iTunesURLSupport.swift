//
//  iTunesURLSupport.swift
//  GeneralSearch
//
//  Created by Carmelo Uria on 4/26/22.
//

import Foundation

var iTunesURLBase: URLComponents {
  var urlComponents = URLComponents()
  urlComponents.scheme = "https"
  urlComponents.host = "itunes.apple.com"
  urlComponents.path = "/search"
  urlComponents.queryItems
    = [URLQueryItem(name: "entity", value: "software"),
       URLQueryItem(name: "limit", value: "10")]
  return urlComponents
}

