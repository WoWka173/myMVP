//
//  AppDelegate.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 09.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = CustomTabBar()
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = .clear
        window?.makeKeyAndVisible()
       
        return true
    }
}

