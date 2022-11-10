// CustomPushAnimator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Анимация открытия экрана
final class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    // MARK: - Private property

    private let animationDuration: TimeInterval = 0.6

    // MARK: - Public methods

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }

        destination.view.layer.anchorPoint = CGPoint(x: 1.0, y: 0.0)
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(rotationAngle: -90)
        transitionContext.containerView.addSubview(destination.view)

        UIView.animateKeyframes(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .calculationModePaced
        ) {
            UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 0.5
            ) {
                source.view.layer.anchorPoint = CGPoint(x: 1.0, y: 0.0)
                let rotation = CGAffineTransform(rotationAngle: 90)
                source.view.transform = rotation
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.5,
                relativeDuration: 0.5
            ) {
                destination.view.transform = .identity
            }
        } completion: { finished in
            if finished, !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
