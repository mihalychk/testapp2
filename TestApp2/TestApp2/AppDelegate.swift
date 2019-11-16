//
//  AppDelegate.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 10.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?

    private(set) var mainCoordinator: MainCoordinator?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set up main window.
        window = UIWindow(frame: UIScreen.main.bounds)

        mainCoordinator = MainCoordinator()
        window?.rootViewController = mainCoordinator?.viewController

        window?.makeKeyAndVisible()
        mainCoordinator?.makeKeyAndVisible()

        return true
    }

}
