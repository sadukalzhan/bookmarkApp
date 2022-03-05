//
//  AppDelegate.swift
//  BookmarkUIkit
//
//  Created by Saduakas Kalzhan on 21.02.2022.
//

import UIKit



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()

        
        if Storage.linkModels.isEmpty{
            window?.rootViewController = UINavigationController(rootViewController:  ViewController())
        }
        else {
            window?.rootViewController = UINavigationController(rootViewController:  TableViewController())
        }
          
        
        return true
    }

  
}

