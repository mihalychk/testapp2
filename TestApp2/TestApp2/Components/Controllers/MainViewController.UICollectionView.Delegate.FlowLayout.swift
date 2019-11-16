//
//  MainViewController.UICollectionView.Delegate.FlowLayout.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interitemSpacing = self.collectionView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: indexPath.item)
        let sectionInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        let frame = collectionView.frame.inset(by: collectionView.contentInset).inset(by: sectionInsets)
        let imagesInRow = CGFloat(Appearance.imagesInRow > 0 ? Appearance.imagesInRow : 1)
        let width = (frame.width - interitemSpacing * (imagesInRow - 1)) / imagesInRow

        return CGSize(width: width, height: width)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Appearance.padding, left: Appearance.padding, bottom: 0.0, right: Appearance.padding)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return Appearance.padding
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return Appearance.padding
    }

}
