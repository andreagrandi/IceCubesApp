import Foundation

public protocol AnyStatus {
  var id: String { get }
  var content: String { get }
  var account: Account { get }
  var createdAt: String { get }
  var mediaAttachments: [MediaAttachement] { get }
  var mentions: [Mention] { get }
}

public struct Status: AnyStatus, Codable, Identifiable {
  public let id: String
  public let content: HTMLString
  public let account: Account
  public let createdAt: ServerDate
  public let reblog: ReblogStatus?
  public let mediaAttachments: [MediaAttachement]
  public let mentions: [Mention]
  
  public static func placeholder() -> Status {
    .init(id: UUID().uuidString,
          content: "Some post content\n Some more post content \n Some more",
          account: .placeholder(),
          createdAt: "2022-12-16T10:20:54.000Z",
          reblog: nil,
          mediaAttachments: [],
          mentions: [])
  }
  
  public static func placeholders() -> [Status] {
    [.placeholder(), .placeholder(), .placeholder(), .placeholder(), .placeholder()]
  }
}

public struct ReblogStatus: AnyStatus, Codable, Identifiable {
  public let id: String
  public let content: String
  public let account: Account
  public let createdAt: String
  public let mediaAttachments: [MediaAttachement]
  public let mentions: [Mention]
}