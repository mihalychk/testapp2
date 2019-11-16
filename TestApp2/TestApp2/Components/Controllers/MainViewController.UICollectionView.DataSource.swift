//
//  MainViewController.UICollectionView.DataSource.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MainCollectionViewCell.dequeueReusableCell(in: collectionView, for: indexPath)

        let item = get(itemFor: indexPath)
        cell.item = item
        mainViewController(self, wantsToLoadImageFor: item)

        return cell
    }

}
