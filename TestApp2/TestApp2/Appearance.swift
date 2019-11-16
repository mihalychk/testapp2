//
//  Appearance.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

struct Appearance {

    @available(*, unavailable) init() {
        Logger.fatal("init() is not allowed")
    }

}

extension Appearance {

    static let backgroundColor: UIColor = {
        if #available(iOS 13.0, *) {
            return .tertiarySystemBackground
        }
        return .white
    }()

    static let cellBackgroundColor: UIColor = {
        if #available(iOS 13.0, *) {
            return .tertiarySystemFill
        }
        return .white
    }()

    static let interactionColor: UIColor = {
        if #available(iOS 13.0, *) {
            return .link
        }
        return UIView().tintColor
    }()

    static let imagesInRow: UInt = 2

    static let loaderLineWidth: CGFloat = 4.0

    static let loaderRadius: CGFloat = 16.0

    static let padding: CGFloat = 16.0

}
