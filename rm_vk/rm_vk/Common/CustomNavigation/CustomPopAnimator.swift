// CustomPopAnimator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Анимация закрытия экрана
final class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    // MARK: - Private property

    private let animationDuration: TimeInterval = 0.6

    // MARK: - Public methods

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }

        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        source.view.layer.anchorPoint = CGPoint(x: 1.0, y: 0.0)
        destination.view.layer.anchorPoint = CGPoint(x: 1.0, y: 0.0)
        destination.view.frame = source.view.frame
        let rotation = CGAffineTransform(rotationAngle: 90)
        destination.view.transform = rotation

        UIView.animateKeyframes(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .calculationModePaced,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.5,
                    animations: {
                        let rotation = CGAffineTransform(rotationAngle: -90)
                        source.view.transform = rotation
                    }
                )
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5,
                    animations: {
                        destination.view.transform = .identity
                    }
                )
            },
            completion: { finished in
                if finished, !transitionContext.transitionWasCancelled {
                    source.removeFromParent()
                } else if transitionContext.transitionWasCancelled {
                    destination.view.transform = .identity
                }
                transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
            }
        )
    }
}
