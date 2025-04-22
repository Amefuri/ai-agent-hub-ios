//
//  AgentTarget.swift
//  AIAgentHub
//
//  Created by peerapat atawatana on 19/4/2568 BE.
//

import Moya

enum AgentTarget: TargetType {
    case fetchAgents(page: Int, limit: Int)

    var baseURL: URL {
        return URL(string: "https://ai-agent-hub-backend.onrender.com")!
    }

    var path: String {
        switch self {
        case .fetchAgents:
            return "/api/agents"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchAgents:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchAgents(let page, let limit):
            return .requestParameters(
                parameters: [
                    "page": page,
                    "limit": limit
                ],
                encoding: URLEncoding.default
            )
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
