
import SwiftUI

final class HomeDIContainer {
    func makeHomeView() -> some View {
        let repository = DefaultAgentRepository()
        let useCase = DefaultFetchFeaturedAgentsUseCase(repository: repository)
        let viewModel = HomeViewModel(fetchAgentsUseCase: useCase)
        return HomeView(viewModel: viewModel)
    }
}
