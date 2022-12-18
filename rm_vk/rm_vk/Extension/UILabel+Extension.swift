// UILabel+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit.UILabel

/// Расширение для подсчета строк в UILabel
extension UILabel {
    var actualNumberOfLines: Int {
        guard let text = text else {
            return 0
        }
        layoutIfNeeded()
        let rect = CGSize(width: frame.width, height: CGFloat(Float.infinity))
        let labelSize = text.boundingRect(
            with: rect,
            options: .usesLineFragmentOrigin,
            attributes: [.font: font as Any],
            context: nil
        )
        return Int(ceil(CGFloat(labelSize.height) / font.lineHeight))
    }
}
