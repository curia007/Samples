//
//  ItemRow.swift
//  Samples
//
//  Created by Carmelo Uria on 4/27/22.
//

import SwiftUI

struct ItemRow: View {
    var item : ServiceDetail
    
    var body: some View {
        VStack (alignment: .leading) {
          Text(item.name)
            .font(.headline)
          HStack {
            Text("$" + Int(item.price.rounded()).description)
              .foregroundColor(.secondary)
              .font(.largeTitle)
            Spacer()
            Text(item.artistName).font(.footnote)
          }
        }
    }
}

