
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    FeatureAgentCarouselView(agents: viewModel.featuredAgents.items)
                    
                    AgentSectionView(title: "Popular Agent", agents: viewModel.popularAgents.items, isLoadingMore: viewModel.popularAgents.isLoading, onScrolledToEnd: {
                        viewModel.loadMorePopularAgents()
                    })
                    
                    AllAgentGridView(agents: viewModel.agents.items,
                                     onScrolledToEnd: {
                        viewModel.loadMoreAgents()
                    })
                }
            }
            .onAppear { viewModel.onAppear() }
            .navigationTitle("AIAgentHub")
        }
    }
}

#Preview {
    HomeDIContainer().makeHomeView()
}
