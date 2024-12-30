//
//  TabBarCoordinator.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 26.12.24.
//



import UIKit.UINavigationController

final class TabBarCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        configureTabBar()
     }
    private var tabBarController = TabBarController()
    private var homeCoordinator:HomeCoordinator?
    private var favoriteCoordinator: FavoriteCoordinator?
    
    fileprivate func configureTabBar() {
        let homeNavigationController = UINavigationController()
        homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeCoordinator?.parentCoordinator = parentCoordinator
        let homeItem = UITabBarItem()
        homeItem.title = "Home"
        homeItem.image = UIImage(systemName: "house")
        homeItem.selectedImage = UIImage(systemName: "house.fill")
        homeNavigationController.tabBarItem = homeItem
        
        let favNavController = UINavigationController()
        favoriteCoordinator = FavoriteCoordinator(navigationController: favNavController)
        favoriteCoordinator?.parentCoordinator = parentCoordinator
        
      
        let favItem = UITabBarItem()
        favItem.title = "Favourite"
        favItem.image = UIImage(systemName: "heart")
        favItem.selectedImage = UIImage(systemName: "heart.fill")
        favNavController.tabBarItem = favItem
        
        tabBarController.viewControllers = [
            homeNavigationController,
            favNavController
        ]
        
        navigationController.pushViewController(tabBarController, animated: true)

        parentCoordinator?.children.append(
            homeCoordinator ?? HomeCoordinator(navigationController: UINavigationController())
        )
        
        parentCoordinator?.children.append(
            favoriteCoordinator ?? FavoriteCoordinator(navigationController: UINavigationController())
        )
        
        homeCoordinator?.start()
        favoriteCoordinator?.start()
    }
    
}
