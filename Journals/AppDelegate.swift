//
//  AppDelegate.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Property

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

        let statusBarBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20))

        statusBarBackgroundView.backgroundColor = UIColor.white

        self.window?.rootViewController?.view.addSubview(statusBarBackgroundView)

        return true
    }

}
