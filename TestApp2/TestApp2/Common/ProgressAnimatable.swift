//
//  ProgressAnimatable.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 12.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

protocol ProgressAnimatable: AnyObject {

    var progressAnimationLayer: CAShapeLayer? { get set }

    func setUpProgressAnimationLayer()

    func hookUp(progressAnimationLayerWith parentLayer: CALayer)

    func layout(progressAnimationFor rect: CGRect)

    func set(progressAnimationValue value: CGFloat)

}

extension ProgressAnimatable where Self: UIView {

    func setUpProgressAnimationLayer() {
        let layer = CAShapeLayer()
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        layer.lineWidth = Appearance.loaderLineWidth
        layer.strokeColor = Appearance.interactionColor.cgColor

        progressAnimationLayer = layer
    }

    func hookUp(progressAnimationLayerWith parentLayer: CALayer) {
        if let animationLayer = progressAnimationLayer {
            layer.addSublayer(animationLayer)
        }
    }

    func set(progressAnimationValue value: CGFloat) {
        if value > 0.01 && value < 1.0 {
            progressAnimationLayer?.strokeEnd = value
        } else if value <= 0.01 {
            progressAnimationLayer?.strokeEnd = 0.01
        } else {
            progressAnimationLayer?.strokeEnd = 1.0
        }
    }

    func layout(progressAnimationFor rect: CGRect) {
        if progressAnimationLayer?.path == nil {
            let center = rect.center
            progressAnimationLayer?.path = create(ringPathWith: center, radius: Appearance.loaderRadius).cgPath
            progressAnimationLayer?.strokeEnd = 0.0
        }
    }

    private func create(ringPathWith center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let bezierPath = UIBezierPath()
        let startAngle = CGFloat(Double.pi * -0.5)
        let endAngle = CGFloat(1.5 * Double.pi)

        bezierPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        return bezierPath
    }

}
