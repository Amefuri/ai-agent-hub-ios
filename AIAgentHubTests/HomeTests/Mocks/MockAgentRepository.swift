
import Combine
@testable import AIAgentHub
import Foundation

final class MockAgentRepository: AgentRepository {
    func fetchFeaturedAgents() -> AnyPublisher<[Agent], Error> {
        let agents = [Agent(id: UUID(), name: "Test Agent", description: "Mocked", imageUrl: URL(string: "https://example.com")!)]
        return Just(agents)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
