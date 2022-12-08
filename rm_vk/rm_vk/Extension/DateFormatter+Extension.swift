// DateFormatter+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Форматирование даты
extension DateFormatter {
    static let bigDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy HH:mm"
        return formatter
    }()
}
