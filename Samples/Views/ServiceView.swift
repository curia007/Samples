//
//  ServiceView.swift
//  Samples
//
//  Created by Carmelo Uria on 4/27/22.
//

import SwiftUI

struct ServiceView {
    @StateObject private var request = Request()
    @State private var searchTerm = ""
}

extension ServiceView: View {
    var body: some View {
        VStack {
          TextField("Enter Search Term",
                    text: $searchTerm)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
          List(request.results) {result in
            HStack {
              request.images[result.name].map(Image.init(uiImage:))
              GeneralSearchDetailsView(generalDetails: result)
            }
          }
          
        }
        .onChange(of: searchTerm){ newSearchTerm in
          request.searchTerm = newSearchTerm
        }
      }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
    }
}

