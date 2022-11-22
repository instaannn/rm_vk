// Api.swift
// Copyright © RoadMap. All rights reserved.

/// Апи
enum Api {
    static let baseUrl = "https://api.vk.com/method/"
    static let acessToken = "?&access_token=\(Session.shared.token)"
    static let userId = "user_id=\(Session.shared.userId)"
    static let version = "&v=5.131"
    static let friendsFields = "&fields=nickname"
    static let extended = "&extended=1"
}
