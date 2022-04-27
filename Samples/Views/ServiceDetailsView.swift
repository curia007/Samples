//
//  GeneralSearchDetailsView.swift
//  GeneralSearch
//
//  Created by Carmelo Uria on 4/26/22.
//
import SwiftUI

struct GeneralSearchDetailsView {
  let generalDetails: GeneralDetails
}

extension GeneralSearchDetailsView: View {
  var body: some View {
    VStack (alignment: .leading) {
      Text(generalDetails.name)
        .font(.headline)
      HStack {
        Text(Int(generalDetails.rating.rounded()).description)
          .foregroundColor(.secondary)
          .font(.largeTitle)
        Spacer()
        Text(generalDetails.sellerName).font(.footnote)
      }
    }
  }
}
