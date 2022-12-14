//
//  AppDelegate.swift
//  Calculator
//
//  Created by Mikita Piatrushka on 25.11.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.green
        
        let screenVC = MainViewController()
        
        window?.rootViewController = screenVC
        window?.makeKeyAndVisible()
        
        return true
    }




}

