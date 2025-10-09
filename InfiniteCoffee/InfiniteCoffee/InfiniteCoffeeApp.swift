//
//  InfiniteCoffeeApp.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI
import FirebaseCore

@main
struct InfiniteCoffeeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
