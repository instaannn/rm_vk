// CustomNavigationController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомный навигейшн контроллер
final class CustomNavigationController: UINavigationController {
    // MARK: - Private Properties

    private let interactiveTransition = CustomInteractiveTransition()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
    }

    // MARK: - Private methods

    private func setupNavigationController() {
        delegate = self
    }
}

// MARK: - UINavigationControllerDelegate

extension CustomNavigationController: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        interactiveTransition.isStarted ? interactiveTransition : nil
    }

    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            interactiveTransition.viewController = toVC
            return CustomPushAnimator()
        case .pop:
            guard navigationController.viewControllers.first != toVC else {
                return CustomPopAnimator()
            }
            interactiveTransition.viewController = toVC
        default:
            break
        }
        return nil
    }
}
