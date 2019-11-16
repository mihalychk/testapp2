//
//  Network.Manageable.Task.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol NetworkManageableTask: ManageableTask {

    var onCancel: (() -> Void)? { get set }

    var onFailure: ((Error) -> Void)? { get set }

    var onFinish: (() -> Void)? { get set }

    var onProgress: ((Progress) -> Void)? { get set }

    var onStart: (() -> Void)? { get set }

    var onSuspend: (() -> Void)? { get set }

    var onSuccess: ((Data, String?, Any?) -> Void)? { get set }

}
