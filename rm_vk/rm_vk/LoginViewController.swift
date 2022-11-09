// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран входа
final class LoginViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let lightBorderColorName = "lightBorder"
        static let segueIdentifier = "loginVC"
        static let alertTitle = "Ошибка"
        static let alertMessage = "Логин и/или пароль неверны."
        static let loginText = "1"
        static let passwordText = "1"
        static let uIStoryboardName = "Main"
        static let viewControllerIdentifier = "MainTabBarController"
    }

    // MARK: - IBOutlet

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loadingView: DotsLoadingView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        addTapGestureRecognizer()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }

    // MARK: - IBAction

    @IBAction private func loginButtonAction() {
        guard checkLoginInfo()
        else {
            showAlert(title: Constants.alertTitle, message: Constants.alertMessage)
            return
        }
        loadingView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyboard = UIStoryboard(name: Constants.uIStoryboardName, bundle: nil)
            guard let mainTabBarController = storyboard.instantiateViewController(
                withIdentifier: Constants.viewControllerIdentifier
            ) as? MainTabBarController else { return }
            mainTabBarController.modalPresentationStyle = .fullScreen
            self.present(mainTabBarController, animated: true)
        }
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

    private func addTapGestureRecognizer() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardHideTapAction))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
    }

    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func checkLoginInfo() -> Bool {
        guard let login = nameTextField.text,
              let password = passwordTextField.text,
              login == Constants.loginText,
              password == Constants.passwordText
        else {
            return false
        }
        return true
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
