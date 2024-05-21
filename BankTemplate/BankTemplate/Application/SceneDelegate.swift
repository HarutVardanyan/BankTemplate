//
//  SceneDelegate.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/17/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return}
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = SignInViewController()
        window.makeKeyAndVisible()
        self.window = window
    }

}

