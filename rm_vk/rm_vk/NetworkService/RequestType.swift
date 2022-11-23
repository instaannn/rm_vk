// RequestType.swift
// Copyright © RoadMap. All rights reserved.

/// типы запросов
enum RequestType {
    case friends
    case groups
    case photos(id: Int)
    case searchGroups(searchQuery: String)

    var urlString: String {
        switch self {
        case .friends:
            return "\(NetworkPath.friends)\(Api.acessToken)\(Api.friendsFields)"
        case .groups:
            return "\(NetworkPath.groups)\(Api.userId)\(Api.extended)\(Api.acessToken)"
        case let .photos(id):
            return "\(NetworkPath.photos)\(Api.acessToken)\(Api.extended)&owner_id=\(-id)"
        case let .searchGroups(searchQuery):
            return "\(NetworkPath.groupsSearch)\(Api.acessToken)&q=\(searchQuery)"
        }
    }
}
