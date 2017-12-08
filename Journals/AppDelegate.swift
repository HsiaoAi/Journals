//
//  AppDelegate.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // NavigationController
        let landingTableViewController = LandingTableViewController()

        let navigationController = UINavigationController(rootViewController: landingTableViewController)

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()

        // NavigationController Appearance

        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.kern: -0.5
        ]

        return true
    }

}
