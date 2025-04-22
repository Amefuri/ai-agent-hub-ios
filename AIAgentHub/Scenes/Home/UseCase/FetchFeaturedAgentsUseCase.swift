
import Combine

protocol FetchFeaturedAgentsUseCase {
    func execute(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error>
}

final class DefaultFetchFeaturedAgentsUseCase: FetchFeaturedAgentsUseCase {
    private let repository: AgentRepository

    init(repository: AgentRepository) {
        self.repository = repository
    }

    func execute(page: Int = 1, limit: Int = 10) -> AnyPublisher<Paginated<Agent>, Error> {
        repository.fetchFeaturedAgents(page: page, limit: limit)
    }
}
