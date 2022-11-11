// CustomInteractiveTransition.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерактивная анимация закрытия экрана
final class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    // MARK: - Public property

    var viewController: UIViewController? {
        didSet {
            addEdgePanGestureRecognizer()
        }
    }

    var isStarted: Bool = false

    // MARK: - Private Properties

    private var isFinished: Bool = false

    // MARK: - Private Methods

    private func addEdgePanGestureRecognizer() {
        let edgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(
            target: self,
            action: #selector(handleScreenEdgeGestureAction(_:))
        )
        edgePanGestureRecognizer.edges = [.left]
        viewController?.view.addGestureRecognizer(edgePanGestureRecognizer)
    }

    @objc private func handleScreenEdgeGestureAction(_ recognizer: UIScreenEdgePanGestureRecognizer) {
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
