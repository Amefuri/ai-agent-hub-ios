
import Foundation

struct Agent: Identifiable, Codable {
    let id: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let name: String
    let description: String
    let imageUrl: URL
    let systemPrompt: String
    let inputTemplate: String
    let personality: String
    let userId: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
        case deletedAt = "DeletedAt"
        case name
        case description
        case imageUrl = "avatar"
        case systemPrompt = "system_prompt"
        case inputTemplate = "input_template"
        case personality
        case userId
    }
}
