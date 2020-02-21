//
//  AppDelegate.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 12/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let appDI = AppDIContainer()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let homeRootView = appDI.makeHomeViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: homeRootView)
        window?.makeKeyAndVisible()
        return true
    }

}

