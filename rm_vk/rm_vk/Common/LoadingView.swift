// LoadingView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Анимация загрузки три точки
final class LoadingView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let backgroundColorName = "primary"
        static let keyPath = "opacity"
    }

    // MARK: - Private Visual Components

    private let circleOneView = UIView()
    private let circleTwoView = UIView()
    private let circleThreeView = UIView()
    private var circles: [UIView] = []

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.frame = CGRect(origin: .zero, size: frame.size)
        return stackView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    // MARK: - Private Methods

    private func configure() {
        circles = [circleOneView, circleTwoView, circleThreeView]

        for circle in circles {
            circle.layer.cornerRadius = bounds.height / 2
            circle.backgroundColor = UIColor(named: Constants.backgroundColorName)
            circle.alpha = 0.5
            stackView.addArrangedSubview(circle)
        }
        addSubview(stackView)
        animate()
    }

    private func animate() {
        var delay = 0.0
        circles.forEach {
            delay += 0.3
            animateCircle(for: $0, delay: delay)
        }
    }

    private func animateCircle(for view: UIView, delay: Double) {
        let animation = CABasicAnimation(keyPath: Constants.keyPath)
        animation.fromValue = 1
        animation.toValue = 0.5
        animation.duration = 0.7
        animation.beginTime = CACurrentMediaTime() + delay
        animation.repeatCount = .infinity
        animation.fillMode = .backwards
        animation.autoreverses = true
        view.layer.add(animation, forKey: nil)
    }
}
