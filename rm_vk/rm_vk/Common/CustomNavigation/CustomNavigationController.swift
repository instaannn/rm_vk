// CustomNavigationController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомный навигейшн контроллер
final class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    // MARK: - Private Properties

    private let interactiveTransition = CustomInteractiveTransition()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    // MARK: - Public methods

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
        if operation == .push {
            interactiveTransition.viewController = toVC
            return CustomPushAnimator()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                interactiveTransition.viewController = toVC
            }
            return CustomPopAnimator()
        }
        return nil
    }
}
