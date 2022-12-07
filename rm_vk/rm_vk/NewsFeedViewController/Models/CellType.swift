// CellType.swift
// Copyright © RoadMap. All rights reserved.

/// Типы ячеек
enum CellType {
    case header(item: HeaderItem)
    case post(item: PostItem)
    case photoPost(item: String)
    case footer(item: Int)
}
