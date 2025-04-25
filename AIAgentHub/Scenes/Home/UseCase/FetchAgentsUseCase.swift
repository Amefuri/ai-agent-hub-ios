
import Combine

protocol FetchAgentsUseCase {
    func execute(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error>
}

final class DefaultFetchAgentsUseCase: FetchAgentsUseCase {
    private let repository: AgentRepository

    init(repository: AgentRepository) {
        self.repository = repository
    }

    func execute(page: Int = 1, limit: Int = 10) -> AnyPublisher<Paginated<Agent>, Error> {
        repository.fetchAgents(page: page, limit: limit)
    }
}
