//
//  AppDelegate.swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/22.
//

import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Firebaseの設定
        FirebaseApp.configure()
        return true
    }
}
