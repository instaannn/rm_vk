// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для универсального алерта
extension UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let alertActionTitle = "Ok"
    }

    // MARK: - Public methods

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.alertActionTitle, style: .cancel, handler: .none)
        alert.addAction(action)
        present(alert, animated: true, completion: .none)
    }
}
