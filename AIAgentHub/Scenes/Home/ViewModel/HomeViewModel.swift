
import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var agents: Paginated<Agent> = .init(items: [], hasMore: true)
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let fetchAgentsUseCase: FetchFeaturedAgentsUseCase
    private var cancellables = Set<AnyCancellable>()

    init(fetchAgentsUseCase: FetchFeaturedAgentsUseCase) {
        self.fetchAgentsUseCase = fetchAgentsUseCase
    }

    func onAppear() {
        loadInitialData()
        
//        isLoading = true
//        fetchAgentsUseCase.execute(page: 1, limit: 10)
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] completion in
//                self?.isLoading = false
//                if case let .failure(error) = completion {
//                    self?.errorMessage = error.localizedDescription
//                }
//            } receiveValue: { [weak self] agents in
//                self?.agents = agents
//            }
//            .store(in: &cancellables)
    }
    
    func loadInitialData() {
        isLoading = true
        fetchAgentsUseCase.execute(page: 1, limit: 10)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching agents: \(error)")
                }
            })
            .replaceError(with: .init(items: [], hasMore: false))
            .assign(to: \.agents, on: self)
            .store(in: &cancellables)
    }
    
    func loadMoreAgents() {
        guard agents.hasMore else { return }
        
        fetchAgentsUseCase.execute(page: (agents.items.count / 10) + 1, limit: 10)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching agents: \(error)")
                }
            })
            .replaceError(with: .init(items: [], hasMore: false))
            .sink { [weak self] agents in
                self?.agents.items += agents.items
                self?.agents.hasMore = agents.hasMore
            }
            .store(in: &cancellables)
    }
}
