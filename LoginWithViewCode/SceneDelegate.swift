//
//  SceneDelegate.swift
//  LoginWithViewCode
//
//  Created by DAVI PEREIRA DA SILVA on 27/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // AppDelegate - lifecylce and app settings
    // SceneDelegate - show what is show in screen, manipulate and manage


    // Create a new UIWindow, define the controller root and returns the main window
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let loginViewController = LoginViewController()
        let navigationViewController = UINavigationController(rootViewController: loginViewController)

        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()

        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

