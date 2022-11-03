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
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.alertActionTitle, style: .cancel, handler: .none)
        alertController.addAction(action)
        present(alertController, animated: true, completion: .none)
    }
}
