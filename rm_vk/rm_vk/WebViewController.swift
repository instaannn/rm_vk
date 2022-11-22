// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран отображения вебвью
final class WebViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let scheme = "https"
        static let host = "oauth.vk.com"
        static let path = "/authorize"
        static let uRLQueryItemClientName = "client_id"
        static let uRLQueryItemClientValue = "51483896"
        static let uRLQueryItemDisplayName = "display"
        static let uRLQueryItemDisplayValue = "mobile"
        static let uRLQueryItemRedirectUriName = "redirect_uri"
        static let uRLQueryItemRedirectUriValue = "https://oauth.vk.com/blank.html"
        static let uRLQueryItemScopeName = "scope"
        static let uRLQueryItemScopeValue = "friends, photos"
        static let uRLQueryItemResponseTypeName = "response_type"
        static let uRLQueryItemResponseTypeValue = "token"
        static let uRLQueryItemVName = "v"
        static let uRLQueryItemVValue = "5.124"
        static let urlPath = "/blank.html"
        static let ampersant = "&"
        static let equals = "="
        static let accessTokenName = "access_token"
        static let userIdName = "user_id"
        static let uIStoryboardName = "Main"
        static let storyboardIdentifier = "MainTabBarController"
    }

    // MARK: - IBOutlet

    @IBOutlet private var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        webViewLoad()
    }

    // MARK: - Private Methods

    private func webViewLoad() {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        urlComponents.host = Constants.host
        urlComponents.path = Constants.path
        urlComponents.queryItems = [
            URLQueryItem(name: Constants.uRLQueryItemClientName, value: Constants.uRLQueryItemClientValue),
            URLQueryItem(name: Constants.uRLQueryItemDisplayName, value: Constants.uRLQueryItemDisplayValue),
            URLQueryItem(
                name: Constants.uRLQueryItemRedirectUriName,
                value: Constants.uRLQueryItemRedirectUriValue
            ),
            URLQueryItem(name: Constants.uRLQueryItemScopeName, value: Constants.uRLQueryItemScopeValue),
            URLQueryItem(
                name: Constants.uRLQueryItemResponseTypeName,
                value: Constants.uRLQueryItemResponseTypeValue
            ),
            URLQueryItem(name: Constants.uRLQueryItemVName, value: Constants.uRLQueryItemVValue)
        ]

        guard let url = urlComponents.url else { return }

        let request = URLRequest(url: url)
        webView.load(request)
    }
}

// MARK: - WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
    ) {
        guard let url = navigationResponse.response.url,
              url.path == Constants.urlPath,
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }

        let params = fragment
            .components(separatedBy: Constants.ampersant)
            .map { $0.components(separatedBy: Constants.equals) }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }

        guard let token = params[Constants.accessTokenName],
              let userId = params[Constants.userIdName]
        else {
            decisionHandler(.allow)
            return
        }

        Session.shared.token = token
        Session.shared.userId = userId

        let storyboard = UIStoryboard(name: Constants.uIStoryboardName, bundle: nil)
        guard let mainTabBarController = storyboard.instantiateViewController(
            withIdentifier: Constants.storyboardIdentifier
        ) as? MainTabBarController else { return }
        mainTabBarController.modalPresentationStyle = .fullScreen
        present(mainTabBarController, animated: true)

        decisionHandler(.cancel)
    }
}
