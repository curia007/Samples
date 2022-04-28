//
//  GeneralSearchDetailView.swift
//  GeneralSearch
//
//  Created by Carmelo Uria on 4/26/22.
//
import SwiftUI
import AVKit

struct ServiceDetailView {
    let item: ServiceDetail
    let images: [String : UIImage]
}

extension ServiceDetailView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 1) {
                VideoPlayer(player: AVPlayer(url: item.previewURL))
                    .frame(alignment: .center)
                    .padding()
            }
            .frame(alignment: .top)
            Divider()
            HStack() {
                Text("Name")
                Text(item.name)
                    .font(.headline)
            }
            Spacer()
            Divider()
            HStack (alignment: .top) {
                Text("About")
                Text(item.itemDescription).font(.footnote)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

struct ServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let images = [String : UIImage]()
        ServiceDetailView(item: ServiceDetail(name: "Carmelo Uria", price: 10.0, artworkURL: URL(string: "https:\\test")!, largeArtworkURL: URL(string: "https:\\test")!, previewURL: URL(string: "https:\\")!, artistName: "artist name", kind: "feature-film", itemDescription: "Item Description"), images: images)
    }
}
