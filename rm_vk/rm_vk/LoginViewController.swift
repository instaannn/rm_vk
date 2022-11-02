// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран входа
final class LoginViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let lightBorderColorName = "lightBorder"
        static let identifierSegue = "loginVC"
        static let alertTitle = "Ошибка"
        static let alertMessage = "Логин и/или пароль неверны."
        static let loginText = "admin"
        static let passwordText = "123456"
    }

    // MARK: - IBOutlet

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        addTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }

    // MARK: - Navigation

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Constants.identifierSegue {
            if checkLoginInfo() {
                return true
            } else {
                showAlert(title: Constants.alertTitle, message: Constants.alertMessage)
                return false
            }
        }
        return true
    }

    // MARK: - Private Methods

    private func setupTextField() {
        nameTextField.setLeftPaddingPoints(12)
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.borderColor = UIColor(named: Constants.lightBorderColorName)?.cgColor

        passwordTextField.setLeftPaddingPoints(12)
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor(named: Constants.lightBorderColorName)?.cgColor
    }

    private func addObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShowAction),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHideAction),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func addTapGesture() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardHideTapAction))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
    }

    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func checkLoginInfo() -> Bool {
        guard let login = nameTextField.text,
              let password = passwordTextField.text else { return false }
        if login == Constants.loginText, password == Constants.passwordText {
            return true
        } else {
            return false
        }
    }

    @objc private func keyboardWillShowAction(notification: Notification) {
        let info = notification.userInfo as? NSDictionary
        guard let kbSize = (info?.value(
            forKey: UIResponder.keyboardFrameEndUserInfoKey
        ) as? NSValue)?.cgRectValue.size else { return }

        let contentInsert = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        scrollView.contentInset = contentInsert
        scrollView.scrollIndicatorInsets = contentInsert
    }

    @objc private func keyboardWillHideAction(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

    @objc private func keyboardHideTapAction() {
        scrollView.endEditing(true)
    }
}
