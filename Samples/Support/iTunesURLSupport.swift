//
//  iTunesURLSupport.swift
//  GeneralSearch
//
//  Created by Carmelo Uria on 4/26/22.
//

import Foundation

// Global variable that defines specific parameters that is used on te URLSession provider
// https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/Searching.html#//apple_ref/doc/uid/TP40017632-CH5-SW1

var iTunesURLBase: URLComponents {
  var urlComponents = URLComponents()
  urlComponents.scheme = "https"
  urlComponents.host = "itunes.apple.com"  // hostname
  urlComponents.path = "/search"           // api used for provider
  urlComponents.queryItems                 // query items
    = [URLQueryItem(name: "entity", value: "movie"),  // entity type : movie
       URLQueryItem(name: "limit", value: "10")]      // item limit
  return urlComponents
}

