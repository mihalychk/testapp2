//
//  Coordinator.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 10.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {

    var presentingViewController: UIViewController { get }

    var viewController: UIViewController { get }

    func makeKeyAndVisible()

}

extension Coordinator {

    func alert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okText = NSLocalizedString("OK", comment: "")
        let action = UIAlertAction(title: okText, style: .default, handler: nil)
        alertController.addAction(action)

        presentingViewController.present(alertController, animated: true, completion: nil)
    }

    func alert(errorWith message: String?) {
        alert(title: NSLocalizedString("Error", comment: ""), message: message)
    }

}
