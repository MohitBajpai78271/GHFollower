//
//  SceneDelegate.swift
//  GithubFollowers
//
//  Created by Mac on 01/08/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navigationBarAppearance = UINavigationBarAppearance()
           navigationBarAppearance.configureWithOpaqueBackground()

           navigationBarAppearance.backgroundColor
        = UIColor.systemGray6 //  desired color
           navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.label] // Adjust text color as needed
           UINavigationBar.appearance().standardAppearance = navigationBarAppearance
           UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance


           let tabBarAppearance = UITabBarAppearance()
           tabBarAppearance.configureWithOpaqueBackground()
           tabBarAppearance.backgroundColor
        = UIColor.systemGray6 // Or your desired color
           UITabBar.appearance().standardAppearance = tabBarAppearance
           UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance

        configureNavigationiBar()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        // Set the root view controller
        window?.rootViewController = createTabBar()
        
        // Make the window visible
        window?.makeKeyAndVisible()
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavouriteshNC() -> UINavigationController {
        let favouritesVC = FavouritesVC()
        favouritesVC.title = "Favorites"
        favouritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favouritesVC)
    }
    
    func createTabBar()-> UITabBarController{
       
        
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabBar.viewControllers = [createSearchNC(),createFavouriteshNC()]

        
        return tabBar
    }
    
    func configureNavigationiBar(){
        UINavigationBar.appearance().tintColor = .systemGreen
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
extension UINavigationBar {
    
    static func create() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white
        appearance().standardAppearance = navBarAppearance
        appearance().scrollEdgeAppearance = navBarAppearance
        appearance().compactAppearance = navBarAppearance
    }
}

