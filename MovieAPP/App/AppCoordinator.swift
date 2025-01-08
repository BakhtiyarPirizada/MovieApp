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
    
   
    var isLogin = UserDefaults.standard.bool(forKey: "islogin")
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    deinit {
        print(#function)
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
        let coordinator = AuthCoordinator(navigationController: navigationController)
        children.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    fileprivate func showHome() {
        children.removeAll()
        let homeTabBar = TabBarCoordinator(navigationController: navigationController)
        children.append(homeTabBar)
        homeTabBar.parentCoordinator = self
        homeTabBar.start()
    }
}
