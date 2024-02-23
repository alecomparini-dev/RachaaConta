//  Created by Alessandro Comparini on 15/02/24.
//

import UIKit
import UI
import CustomComponentsSDK

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        configureTheme()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let win = UIWindow(windowScene: windowScene)
        let nav = NavigationController()
        win.rootViewController = nav
        win.makeKeyAndVisible()
        window = win
        
        let coordinator = HomeCoordinator(nav)
        coordinator.start()
        
    }
    
    private func configureTheme() {
        Theme.setTheme(ThemeDark())
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

