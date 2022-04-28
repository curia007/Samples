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
                        let images : [String : UIImage] = request.images
                        ServiceDetailView(item: result, images: images)
                    } label: {
                        request.images[result.name].map(Image.init(uiImage:))
                        ItemRow(item : result)
                    }
                }
                .navigationBarHidden(true)
                .padding(.horizontal, -15.0)
            }
            .navigationViewStyle(.stack)
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

