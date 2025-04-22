//
//  FeatureAgentCarouselView.swift
//  AIAgentHub
//
//  Created by peerapat atawatana on 21/4/2568 BE.
//

import SwiftUI
import Kingfisher

struct FeatureAgentCarouselView: View {
    let agents: [Agent]

    var body: some View {
        TabView {
            ForEach(agents) { agent in
//                ZStack {
//                    AsyncImage(url: agent.imageUrl) { image in
//                        image.resizable()
//                    } placeholder: {
//                        Color.gray
//                    }
//                }
                
                ZStack {
                    KFImage(agent.imageUrl)
                        .resizable()
                }
                .aspectRatio(contentMode: .fill)
                .cornerRadius(12)
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 180)
    }
}
