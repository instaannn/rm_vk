// CustomInteractiveTransition.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерактивная анимация закрытия экрана
final class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    // MARK: - Public property

    var viewController: UIViewController? {
        didSet {
            let edgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handleScreenEdgeGesture(_:))
            )
            edgePanGestureRecognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(edgePanGestureRecognizer)
        }
    }

    var isStarted: Bool = false

    // MARK: - Private Properties

    private var isFinished: Bool = false

    // MARK: - Private Methods

    @objc private func handleScreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            isStarted = true
            viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            isFinished = progress > 0.33
            update(progress)
        case .ended:
            isStarted = false
            _ = isFinished ? finish() : cancel()
        case .cancelled:
            isStarted = false
            cancel()
        default: return
        }
    }
}
