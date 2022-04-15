//
//  AppDelegate.swift
//  SturicousApp
//
//  Created by Rj O'Neal on 4/6/22.
//

import UIKit
import CoreData
import Parse

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let configuration = ParseClientConfiguration{
            $0.applicationId = "7ng2dEdGlqF6SDOBOGA8b32hsEkk1aV9VuLFTppa"
            $0.clientKey = "34miiK1cB6c47iDajm0AgUWeSAu7mF0Zn8PUl7YA"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        print("connected")
        
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

