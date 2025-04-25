
import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var agents: Paginated<Agent> = .init(items: [], hasMore: true, isLoading: false)
    @Published var featuredAgents: Paginated<Agent> = .init(items: [], hasMore: true, isLoading: false)
    @Published var popularAgents: Paginated<Agent> = .init(items: [], hasMore: true, isLoading: false)
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let fetchAgentsUseCase: FetchAgentsUseCase
    private let fetchFeaturedAgentsUseCase: FetchFeaturedAgentsUseCase
    private let fetchPopularAgentsUseCase: FetchPopularAgentsUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchAgentsUseCase: FetchAgentsUseCase,
          fetchFeaturedAgentsUseCase: FetchFeaturedAgentsUseCase,
          fetchPopularAgentsUseCase: FetchPopularAgentsUseCase) {
        self.fetchAgentsUseCase = fetchAgentsUseCase
        self.fetchFeaturedAgentsUseCase = fetchFeaturedAgentsUseCase
        self.fetchPopularAgentsUseCase = fetchPopularAgentsUseCase
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
        loadMoreAgents(isRefresh: true)
        loadMoreFeaturedAgents(isRefresh: true)
        loadMorePopularAgents(isRefresh: true)
//        isLoading = true
//        fetchAgentsUseCase.execute(page: 1, limit: 10)
//            .receive(on: DispatchQueue.main)
//            .handleEvents(receiveCompletion: { completion in
//                if case .failure(let error) = completion {
//                    print("Error fetching agents: \(error)")
//                }
//            })
//            .replaceError(with: .init(items: [], hasMore: false))
//            .assign(to: \.agents, on: self)
//            .store(in: &cancellables)
    }
    

    
    func loadMoreAgents(isRefresh: Bool = false) {
        guard agents.hasMore else { return }
        
        agents.isLoading = true
        fetchAgentsUseCase.execute(page: (agents.items.count / 10) + 1, limit: 10)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching agents: \(error)")
                }
            })
            .replaceError(with: .init(items: [], hasMore: false, isLoading: false))
            .sink { [weak self] agents in
                if isRefresh {
                    self?.agents.items = agents.items
                } else {
                    self?.agents.items += agents.items
                }
                self?.agents.hasMore = agents.hasMore
                self?.agents.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func loadMoreFeaturedAgents(isRefresh: Bool = false) {
        guard featuredAgents.hasMore else { return }
        
        featuredAgents.isLoading = true
        fetchFeaturedAgentsUseCase.execute(page: (agents.items.count / 10) + 1, limit: 10)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching featured agents: \(error)")
                }
            })
            .replaceError(with: .init(items: [], hasMore: false, isLoading: false))
            .sink { [weak self] agents in
                if isRefresh {
                    self?.featuredAgents.items = agents.items
                } else {
                    self?.featuredAgents.items += agents.items
                }
                self?.featuredAgents.hasMore = agents.hasMore
                self?.featuredAgents.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func loadMorePopularAgents(isRefresh: Bool = false) {
        guard popularAgents.hasMore else { return }
        
        popularAgents.isLoading = true
        fetchPopularAgentsUseCase.execute(page: (agents.items.count / 10) + 1, limit: 10)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching popular agents: \(error)")
                }
            })
            .replaceError(with: .init(items: [], hasMore: false, isLoading: false))
            .sink { [weak self] agents in
                if isRefresh {
                    self?.popularAgents.items = agents.items
                } else {
                    self?.popularAgents.items += agents.items
                }
                self?.popularAgents.hasMore = agents.hasMore
                self?.popularAgents.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    
}
