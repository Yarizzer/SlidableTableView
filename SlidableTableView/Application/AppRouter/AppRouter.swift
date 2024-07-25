//
//  AppRouter.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import UIKit

enum AppRoutableSceneType {
    case main
}

protocol AppRoutable: AnyObject {
    func routeToScene(with type: AppRoutableSceneType)
}

class AppRouter {
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .systemBackground
        window.makeKeyAndVisible()
    }
    
    private let window: UIWindow
}

extension AppRouter: AppRoutable {
    func routeToScene(with type: AppRoutableSceneType) {
        switch type {
        case .main:      window.rootViewController = MainSceneRouter.assembly()
        }
    }
}
