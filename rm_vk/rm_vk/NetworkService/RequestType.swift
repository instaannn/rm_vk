// RequestType.swift
// Copyright © RoadMap. All rights reserved.

/// Запросы
enum RequestType {
    case friends
    case groups
    case photos(id: Int)
    case searchGroups(searchQuery: String)

    var urlString: String {
        switch self {
        case .friends:
            return Api.baseUrl + "friends.get?" + Api.acessToken + Api.friendsFields + Api.version
        case .groups:
            return Api.baseUrl + "groups.get?" + Api.userId + Api.extended + Api.acessToken + Api.version
        case let .photos(id):
            return Api.baseUrl + "photos.getAll" + Api.acessToken + Api.extended + "&owner_id=\(-id)" + Api.version
        case let .searchGroups(searchQuery):
            return Api.baseUrl + "groups.search?" + Api.acessToken + "&q=\(searchQuery)" + Api.version
        }
    }
}
