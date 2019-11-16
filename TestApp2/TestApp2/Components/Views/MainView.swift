//
//  MainView.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

class MainView: UIView, LoadingUI, RefreshingUI {

    // MARK: - Outlets

    private(set) var collectionView: UICollectionView!

    // MARK: - LoadingUI

    var loadingActivityIndicatorView: UIActivityIndicatorView?

    // MARK: - RefreshingUI

    var refreshControl: UIRefreshControl?

    var scrollView: UIScrollView? { return collectionView }

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
        setUpLoadingActivityIndicatorView()
        setUpRefreshControl()
        setUpCollectionView()
        hookUp()
    }

    private func setUpSelf() {
        backgroundColor = Appearance.backgroundColor
    }

    private func setUpCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Appearance.backgroundColor
        collectionView.contentInset = .zero

        MainCollectionViewCell.register(collectionView: collectionView)
    }

    private func hookUp() {
        addSubview(collectionView)
        hookUpLoadingActivityIndicatorView()
    }

    @discardableResult private func layout(for size: CGSize, apply: Bool) -> CGSize {
        if apply {
            let safeFrame = bounds.inset(by: safeAreaInsets)
            collectionView.frame = safeFrame
            collectionView.collectionViewLayout.invalidateLayout()

            loadingActivityIndicatorView?.center = safeFrame.center
        }

        return size
    }

}
