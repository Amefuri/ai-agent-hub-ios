
import Combine
import Foundation
import Moya

protocol AgentRepository {
    func fetchAgents(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error>
    func fetchFeaturedAgents(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error>
    func fetchPopularAgents(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error>
}

final class DefaultAgentRepository: AgentRepository {
    
    private let provider: MoyaProvider<AgentTarget> = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60 // Increase if needed
        configuration.timeoutIntervalForResource = 60
        let session = Session(configuration: configuration)
        let provider = MoyaProvider<AgentTarget>(session: session)
        return provider
    }()
    
    func fetchAgents(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error> {
        provider.requestPublisher(.fetchAgents(page: page, limit: limit))
            .map(\.data)
            .decode(type: PaginatedResponse<Agent>.self, decoder: JSONDecoder())
            .map { Paginated(items: $0.data, hasMore: $0.hasMore, isLoading: false) }
            .eraseToAnyPublisher()
    }
    
    func fetchFeaturedAgents(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error> {
        provider.requestPublisher(.fetchFeaturedAgents(page: page, limit: limit))
            .map(\.data)
            .decode(type: PaginatedResponse<Agent>.self, decoder: JSONDecoder())
            .map { Paginated(items: $0.data, hasMore: $0.hasMore, isLoading: false) }
            .eraseToAnyPublisher()
    }
    
    func fetchPopularAgents(page: Int, limit: Int) -> AnyPublisher<Paginated<Agent>, Error> {
        provider.requestPublisher(.fetchPopularAgents(page: page, limit: limit))
            .map(\.data)
            .decode(type: PaginatedResponse<Agent>.self, decoder: JSONDecoder())
            .map { Paginated(items: $0.data, hasMore: $0.hasMore, isLoading: false) }
            .eraseToAnyPublisher()
    }
    
//    func fetchFeaturedAgents(page: Int, limit: Int) -> AnyPublisher<[Agent], Error> {
//        provider.requestPublisher(.fetchAgents(page: page, limit: limit))
//            .handleEvents(receiveOutput: { response in
//                if let jsonString = String(data: response.data, encoding: .utf8) {
//                    print("Debug JSON Response: \(jsonString)")
//                }
//            })
//            .tryMap { response in
//                try JSONDecoder().decode([Agent].self, from: response.data)
//            }
//            .mapError { error -> Error in
//                print("🔴 Full error: \(error)")
//                if let moyaError = error as? MoyaError {
//                    switch moyaError {
//                    case .underlying(let nsError as NSError, _):
//                        print("🚨 Underlying error domain: \(nsError.domain)")
//                        print("🚨 Code: \(nsError.code)")
//                        print("🚨 Description: \(nsError.localizedDescription)")
//                    default:
//                        break
//                    }
//                }
//                return error
//            }
//            .eraseToAnyPublisher()
//    }
}
