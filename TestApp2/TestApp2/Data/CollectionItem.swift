//
//  CollectionItem.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

class CollectionItem: NSObject {

    @objc dynamic var image: UIImage?

    let imageResource: ImageResource

    @objc dynamic var progress: Progress?

    init(with imageResource: ImageResource) {
        self.imageResource = imageResource
        super.init()
    }

    convenience init(with item: CollectionItem) {
        self.init(with: item.imageResource)
    }

}

extension CollectionItem {

    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? CollectionItem else {
            return false
        }

        return imageResource == object.imageResource
    }

    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(imageResource)
        return hasher.finalize()
    }

}

extension CollectionItem {

    func start(download task: NetworkTask) {
        task.onProgress = { [weak self] progress in
            self?.progress = progress
        }
        task.onSuccess = { [weak self] data, _, _ in
            self?.image = UIImage(data: data)
        }
        task.resume()
    }

}
