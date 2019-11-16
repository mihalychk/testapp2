//
//  DetailViewController.CollectionItem.Observable.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 12.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension DetailViewController: CollectionItemObservable {

    func itemImageHasBeenUpdated() {
        // HACK: helps to see the progress completion
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
            self?.detailView.imageView.image = self?.item?.image
            self?.detailView.setNeedsLayout()
        }
    }

    func itemProgressHasBeenUpdated() {
        if let progress = item?.progress {
            let value = CGFloat(progress.completedUnitCount) / CGFloat(progress.totalUnitCount)
            detailView.set(progressAnimationValue: value)
        }
    }

}
