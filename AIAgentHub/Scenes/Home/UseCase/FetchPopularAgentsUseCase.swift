//
//  FetchPopularAgentsUseCase.swift
//  AIAgentHub
//
//  Created by peerapat atawatana on 22/4/2568 BE.
//

import Combine

protocol FetchPopularAgentsUseCase {
    func execute(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error>
}

final class DefaultFetchPopularAgentsUseCase: FetchPopularAgentsUseCase {
    private let repository: AgentRepository

    init(repository: AgentRepository) {
        self.repository = repository
    }

    func execute(page: Int = 1, limit: Int = 10) -> AnyPublisher<Paginated<Agent>, Error> {
        repository.fetchPopularAgents(page: page, limit: limit)
    }
}
