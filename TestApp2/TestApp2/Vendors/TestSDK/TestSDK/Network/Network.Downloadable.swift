//
//  Network.Downloadable.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol NetworkDownloadable: AnyObject {

    var downloadableData: Data { get set }

    func append(downloadableData: Data)

}

extension NetworkDownloadable {

    func append(downloadableData: Data) {
        self.downloadableData.append(downloadableData)
    }

}
