//
//  AppDelegate.swift
//  MetigyNews
//
//  Created by Tarinda on 9/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // A dark grey theme and white texts for the navigation bar across the app
        // To accomodate it apart from the following 2 attributes been set,
        //  1. Deployment Info, 'Status Bar Style' - Light content
        //  2. Info.plist entry, 'View controller-based status bar appearance' - No
        
        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/255, green: 54/244, blue: 64/255, alpha: 1.0)
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

