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
                KFImage(agent.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 180) // Ensure fixed height
                    .cornerRadius(12)
                    .clipped() // Clip after corner radius
                    .padding(.horizontal)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 180) // Slightly more than image height if needed
    }
}
