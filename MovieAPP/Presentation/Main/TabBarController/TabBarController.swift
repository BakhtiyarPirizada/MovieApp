//
//  TabBarController.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 26.12.24.
//


import UIKit
final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    fileprivate func configureUI() {
        view.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .buttonColor2
        tabBar.barTintColor = UIColor()
        tabBar.unselectedItemTintColor = .fonColor8
        tabBar.tintColor = .fonColor8
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.layer.masksToBounds = true
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel],
                for: .normal
            )
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.label],
                for: .selected
            )
        delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        return true
    }
}
