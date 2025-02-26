//
//  AppDelegate.swift
//  LoginExamSwift
//
//  Created by Yuan Soliman on 2/26/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// declaration of variable for UIWindow
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let loginPage = Login()
        let navigationControler = UINavigationController(rootViewController: loginPage)
        window?.rootViewController = navigationControler
        return true    }

   


}

