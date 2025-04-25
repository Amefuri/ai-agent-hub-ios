
import SwiftUI

final class HomeDIContainer {
    func makeHomeView() -> some View {
        let repository = DefaultAgentRepository()
        let fetchAgentsUseCase = DefaultFetchAgentsUseCase(repository: repository)
        let fetchFeaturedAgentsUseCase = DefaultFetchFeaturedAgentsUseCase(repository: repository)
        let fetchPopularAgentsUseCase = DefaultFetchPopularAgentsUseCase(repository: repository)
        let viewModel = HomeViewModel(fetchAgentsUseCase: fetchAgentsUseCase, fetchFeaturedAgentsUseCase: fetchFeaturedAgentsUseCase, fetchPopularAgentsUseCase: fetchPopularAgentsUseCase)
        return HomeView(viewModel: viewModel)
    }
}
