//
//  AllAgentGridView.swift
//  AIAgentHub
//
//  Created by peerapat atawatana on 21/4/2568 BE.
//

import SwiftUI

struct AllAgentGridView: View {
    let agents: [Agent]
    let onScrolledToEnd: () -> Void

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
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
        .padding()
    }
}
