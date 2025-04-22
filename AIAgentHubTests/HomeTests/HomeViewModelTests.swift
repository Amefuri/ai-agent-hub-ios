
import XCTest
import Combine
@testable import AIAgentHub

final class HomeViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func testOnAppear_fetchesAgentsSuccessfully() {
        let mockRepo = MockAgentRepository()
        let useCase = FetchFeaturedAgentsUseCase(repository: mockRepo)
        let viewModel = HomeViewModel(fetchAgentsUseCase: useCase)

        let expectation = XCTestExpectation(description: "Fetch agents")

        viewModel.$agents
            .dropFirst()
            .sink { agents in
                XCTAssertEqual(agents.count, 1)
                XCTAssertEqual(agents.first?.name, "Test Agent")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.onAppear()

        wait(for: [expectation], timeout: 1)
    }
}
