
import SwiftUI

/*struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.agents) { agent in
                        HStack {
                            
//                            AsyncImage(url: agent.imageUrl) { phase in
//                                switch phase {
//                                case .empty:
//                                    ProgressView() // Loading placeholder
//                                    
//                                case .success(let image):
//                                    image
//                                        .resizable()
//                                        .scaledToFit()
//                                    
//                                case .failure(let error):
//                                    
//
//                                    VStack {
//                                        let _ = print("Error loading imageURL: \(agent.imageUrl)")
//                                        let _ = print("Error loading image: \(error.localizedDescription)")
//                                        Image(systemName: "xmark.octagon.fill")
//                                            .font(.largeTitle)
//                                            .foregroundColor(.red)
//                                        Text("Failed to load image")
//                                            .font(.caption)
//                                            .foregroundColor(.gray)
//                                    }
//                                    
//                                @unknown default:
//                                    EmptyView()
//                                }
//                            }
                            
                            
                            AsyncImage(url: agent.imageUrl) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                            VStack(alignment: .leading) {
                                Text(agent.name).bold()
                                Text(agent.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .onAppear { viewModel.onAppear() }
            .navigationTitle("Featured Agents")
        }
    }
}*/

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    FeatureAgentCarouselView(agents: viewModel.agents.items)
                    
                    AgentSectionView(title: "Popular Agent", agents: viewModel.agents.items, onScrolledToEnd: {})
                    
                    AllAgentGridView(agents: viewModel.agents.items, onScrolledToEnd: viewModel.loadMoreAgents)
                }
            }
            .onAppear { viewModel.onAppear() }
            .navigationTitle("AIAgentHub")
        }
        
    }
}

#Preview {
    HomeView(viewModel: .init(fetchAgentsUseCase: DefaultFetchFeaturedAgentsUseCase(repository: DefaultAgentRepository())))
}
