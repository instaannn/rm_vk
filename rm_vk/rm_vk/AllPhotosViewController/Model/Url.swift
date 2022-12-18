// Url.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Ссылка на фото
final class Url: Object, Decodable {
    /// Ссылка на фото
    @objc dynamic var url: String
    /// Ширина фотографии
    @objc dynamic var width: Int
    /// Высота фотографии
    @objc dynamic var height: Int

    /// Соотношение сторон фотографии
    var aspectRation: CGFloat {
        guard width != 0 else { return 0 }
        return CGFloat(width) / CGFloat(height)
    }
}
