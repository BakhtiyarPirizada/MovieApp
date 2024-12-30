//
//  AppCoordinator.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 26.12.24.
//


import Foundation
import UIKit.UINavigationController

final class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
   
    var isLogin: Bool = true
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLogin {
            showHome()
        } else {
            showAuth()
        }
    }
    
    fileprivate func showAuth() {
        children.removeAll()

    }
    
    fileprivate func showHome() {
        children.removeAll()
        let homeTabBar = HomeTabBarCoordinator(navigationController: navigationController)
        children.append(homeTabBar)
        homeTabBar.parentCoordinator = self
        homeTabBar.start()
    }
}
