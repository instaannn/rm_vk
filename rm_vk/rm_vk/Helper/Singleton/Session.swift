// Session.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Singleton для хранения token и userId
final class Session {
    // MARK: - Public properties

    static let shared = Session()
    var token = ""
    var userId = ""

    // MARK: - Initializers

    private init() {}
}
