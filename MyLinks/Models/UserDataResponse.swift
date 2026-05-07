import Foundation

// MARK: - UserDataResponse
struct UserDataResponse: Codable {
    let response: UserData
}

// MARK: - Response
struct UserData: Codable {
    let id: Int
    let name: String?
    let username: String
    let email, emailVerified, unverifiedNewEmail: String?
    let image, locale: String
    let collectionOrder: [Int]
    let linksRouteTo, aiTaggingMethod: String
    let aiPredefinedTags: [String]
    let aiTagExistingLinks: Bool
    let theme, readableFontFamily, readableFontSize, readableLineHeight: String
    let readableLineWidth: String
    let preventDuplicateLinks, archiveAsScreenshot, archiveAsMonolith, archiveAsPDF: Bool
    let archiveAsReadable, archiveAsWaybackMachine, isPrivate: Bool
    let lastPickedAt, createdAt, updatedAt: String
    let dashboardSections: [UserData_DashboardSection]
    let hasUnIndexedLinks: Bool
}

// MARK: - DashboardSection
struct UserData_DashboardSection: Codable {
    let id, userID: Int
    let collectionID: Int?
    let type: String
    let order: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case collectionID = "collectionId"
        case type, order, createdAt, updatedAt
    }
}

