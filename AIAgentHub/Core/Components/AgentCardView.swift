//
//  AgentCardView.swift
//  AIAgentHub
//
//  Created by peerapat atawatana on 21/4/2568 BE.
//

import SwiftUI
import Kingfisher

struct AgentCardView: View {
    let agent: Agent

    var body: some View {
        VStack(alignment: .leading) {
            let _ = print("IMAGE = " + agent.imageUrl.absoluteString)
            ZStack {
//                AsyncImage(url: agent.imageUrl) { image in
//                    image.resizable()
//                } placeholder: {
//                    Color.gray
//                }
//                .aspectRatio(1, contentMode: .fill)
//                .cornerRadius(8)
//                .clipped()
                
            }

            KFImage(agent.imageUrl)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(8)
                .clipped()
            Text(agent.name).bold()
            Text("Brand").font(.caption).foregroundColor(.gray)
        }
        .frame(width: 150)
    }
}
