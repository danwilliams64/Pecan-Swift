//
//  AppDelegate.swift
//  Pecan
//
//  Created by Dan Williams on 07/08/2014.
//  Copyright (c) 2014 Dan Williams. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    lazy var window: UIWindow = {
       let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = UIColor.whiteColor()
        window.rootViewController = self.splitViewController
        window.tintColor = UIColor.customTintColor()
        return window
    }()
    
    lazy var splitViewController: UISplitViewController = {
        let splitViewController = UISplitViewController(nibName: nil, bundle: nil)
        splitViewController.viewControllers = [UINavigationController(rootViewController:WelcomeViewController())]
        return splitViewController
    }()

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        window.makeKeyAndVisible()
        return true
    }
}

