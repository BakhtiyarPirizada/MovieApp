//
//  FavoriteCoordinator.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 30.12.24.
//
import UIKit.UINavigationController
final class FavoriteCoordinator:Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller  = FavoriteController(viewModel: .init())
        showController(vc: controller)
    }
   
}
