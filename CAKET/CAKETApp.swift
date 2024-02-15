//
//  CaketApp.swift
//  Caket
//
//  Created by 肥後凱斗 on 2024/01/25.
//

import SwiftUI
import Firebase

@main
struct CaketApp: App {
    
    init() {
        // Firebaseの設定
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            topView()
        }
    }
}
