//
//  AgentSectionView.swift
//  AIAgentHub
//
//  Created by peerapat atawatana on 21/4/2568 BE.
//

import SwiftUI

struct AgentSectionView: View {
    let title: String
    let agents: [Agent]
    let onScrolledToEnd: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title).font(.headline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(agents.indices, id: \ .self) { i in
                        let agent = agents[i]
                        AgentCardView(agent: agent)
                            .onAppear {
                                if i == agents.count - 1 {
                                    onScrolledToEnd()
                                }
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
