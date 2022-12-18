// PostTextTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol PostTextTableViewCellDelegate: AnyObject {
    func undateCell(rowNumber: Int)
}

/// Ячейка текстовый пост
final class PostTextTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var postLabel: UILabel!
    @IBOutlet private var moreButton: UIButton!

    // MARK: - Public Properties

    weak var delegate: PostTextTableViewCellDelegate?

    // MARK: - Private Properties

    private var indexPath = 0

    // MARK: - Public methods

    func configure(item: Items, indexPath: Int) {
        postLabel.text = item.text
        self.indexPath = indexPath
        let actualNumberOfLines = postLabel.actualNumberOfLines
        if actualNumberOfLines > 5 {
            postLabel.numberOfLines = 4
            moreButton.isHidden = false
        } else {
            postLabel.numberOfLines = 0
            moreButton.isHidden = true
        }
    }

    // MARK: - IBAction

    @IBAction private func moreButtonAction() {
        postLabel.numberOfLines = 0
        moreButton.isHidden = true
        delegate?.undateCell(rowNumber: indexPath)
    }
}
