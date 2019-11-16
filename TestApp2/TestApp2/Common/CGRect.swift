//
//  CGRect.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import CoreGraphics

extension CGRect {

    var center: CGPoint {
        get { return CGPoint(x: midX, y: midY) }
        set {
            origin.x = newValue.x - size.width * 0.5
            origin.y = newValue.y - size.height * 0.5
        }
    }

}
