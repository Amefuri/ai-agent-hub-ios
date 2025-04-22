//
//  PaginatedResponse.swift
//  AIAgentHub
//
//  Created by peerapat atawatana on 22/4/2568 BE.
//

import Foundation

struct PaginatedResponse<T: Decodable>: Decodable {
    let data: [T]
    let page: Int
    let limit: Int
    let hasMore: Bool
    let total: Int
    let totalPages: Int
}
