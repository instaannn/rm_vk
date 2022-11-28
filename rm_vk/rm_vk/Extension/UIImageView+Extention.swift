// UIImageView+Extention.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для загрузки фото по ссылке
extension UIImageView {
    // MARK: - Public methods

    func load(url: URL) {
        DispatchQueue.global().async {
            guard
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
