//
//  ServiceView.swift
//  Samples
//
//  Created by Carmelo Uria on 4/27/22.
//

import SwiftUI

struct ItemList {
    @StateObject private var request = Request()
    @State private var searchTerm = ""
}

extension ItemList: View {
    var body: some View {
        VStack {
            TextField("Enter Search Term",
                      text: $searchTerm)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            NavigationView {
                List(request.results) {result in
                    NavigationLink {
                        ServiceDetailView(item: result)
                    } label: {
                        request.images[result.name].map(Image.init(uiImage:))
                        ItemRow(item : result)
                    }
                }
            }
            .onChange(of: searchTerm){ newSearchTerm in
                request.searchTerm = newSearchTerm
            }
        }
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}

