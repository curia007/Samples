//
//  GeneralSearchDetailView.swift
//  GeneralSearch
//
//  Created by Carmelo Uria on 4/26/22.
//
import SwiftUI

struct ServiceDetailView {
  let item: ServiceDetail
}

extension ServiceDetailView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(item.name)
                    .font(.headline)
            }
            HStack {
                Text("About")
                    .padding()
                Text(item.itemDescription).font(.footnote)
            }
        }
    }
}

struct ServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetailView(item: ServiceDetail(name: "Carmelo Uria", price: 10.00, artworkURL: URL(string: "https://test")!, artistName: "artist Name", kind: "feature-film", itemDescription: "Item Description"))
    }
}
