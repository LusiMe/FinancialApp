//
//  AppDelegate.swift
//  TradingApp
//
//  Created by Mark Parfenov on 03/04/2022.
//

import UIKit
import Firebase

let db = Firestore.firestore()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

      func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        return true
      }

}

