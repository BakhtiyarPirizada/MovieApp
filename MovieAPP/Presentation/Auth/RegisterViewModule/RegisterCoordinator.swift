//
//  RegisterCoordinator.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//
import Foundation
import UIKit.UINavigationController

final class RegisterCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    
    var children: [any Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = RegisterController(viewModel: RegisterViewModel())
        showController(vc: controller)
    }
    
    
}
