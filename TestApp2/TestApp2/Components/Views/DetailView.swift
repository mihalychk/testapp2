//
//  DetailView.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

class DetailView: UIView, ProgressAnimatable {

    // MARK: - Outlets

    private(set) var doubleTapRecognizer: UITapGestureRecognizer!

    private(set) var imageView: UIImageView!

    private(set) var scrollView: UIScrollView!

    // MARK: - ProgressAnimatable

    var progressAnimationLayer: CAShapeLayer?

    // MARK: - Initializing

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    // MARK: - Layout

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return layout(for: size, apply: false)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layout(for: bounds.size, apply: true)
    }

    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        layout(for: bounds.size, apply: true)
    }

    // MARK: - Private

    private func setUp() {
        setUpSelf()
        setUpProgressAnimationLayer()
        setUpImageView()
        setUpScrollView()
        setUpDoubleTapRecognizer()
        hookUp()
    }

    private func setUpSelf() {
        backgroundColor = Appearance.backgroundColor
    }

    private func setUpImageView() {
        imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .clear
    }

    private func setUpScrollView() {
        scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .clear
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
    }

    private func setUpDoubleTapRecognizer() {
        doubleTapRecognizer = UITapGestureRecognizer()
        doubleTapRecognizer.numberOfTapsRequired = 2
    }

    private func hookUp() {
        hookUp(progressAnimationLayerWith: layer)
        addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addGestureRecognizer(doubleTapRecognizer)
    }

    @discardableResult private func layout(for size: CGSize, apply: Bool) -> CGSize {
        if apply {
            let safeFrame = bounds.inset(by: safeAreaInsets)

            layout(progressAnimationFor: safeFrame)

            scrollView.frame = safeFrame
            scrollView.contentSize = safeFrame.size

            if let imageSize = imageView.image?.size {
                let width = min(safeFrame.width, imageSize.width)
                let height = (width / imageSize.width) * imageSize.height
                let x = (safeFrame.width - width) * 0.5
                let y = (safeFrame.height - height) * 0.5
                let imageViewFrame = CGRect(
                    x: x,
                    y: y,
                    width: width,
                    height: height
                )
                imageView.frame = imageViewFrame
            }
        }

        return size
    }

}
