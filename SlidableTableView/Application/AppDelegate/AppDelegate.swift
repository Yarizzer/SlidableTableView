//
//  AppDelegate.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var router: AppRoutable?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.router = AppRouter()
        
        router?.routeToScene(with: .main)

        return true
    }
}
