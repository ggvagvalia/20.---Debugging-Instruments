//
//  SceneDelegate.swift
//  20. დავალება - Debugging & Instruments
//
//  Created by gvantsa gvagvalia on 4/21/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: MainVC())
        self.window = window
        window.makeKeyAndVisible()
    }

}

