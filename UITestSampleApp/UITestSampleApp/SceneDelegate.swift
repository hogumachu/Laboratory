//
//  SceneDelegate.swift
//  UITestSampleApp
//
//  Created by 홍성준 on 1/28/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController(rootViewController: ViewController())
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

