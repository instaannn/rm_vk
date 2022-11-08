// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit.UIView

/// Расширение для анимации shake
extension UIView {
    // MARK: Constants

    private enum Constants {
        static let keyPath = "transform.translation.x"
    }

    // MARK: - Public methods

    func shake(count: Float = 8, for duration: TimeInterval = 0.5, withTranslation translation: Float = 2) {
        let animation = CAKeyframeAnimation(keyPath: Constants.keyPath)
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration / TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: nil)
    }
}
