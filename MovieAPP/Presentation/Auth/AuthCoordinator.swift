//
//  AuthCoordinator.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 07.01.25.
//
import Foundation
import UIKit.UINavigationController

final class AuthCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    
    var children: [any Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginController(viewModel: .init(navigation: self) )
        showController(vc: controller)
    }
}
extension AuthCoordinator: AuthNavigation {
    func showHome() {
  
    }
    
    func showRegister() {
        let controller =  RegisterController(viewModel: .init(navigation: self))
        showController(vc: controller)
    }
    func showLogin() {
        navigationController.popViewController(animated: true)
    }
   
}
