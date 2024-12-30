//
//  CoreController.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 26.12.24.
//

import UIKit

class CoreController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
        configureConstraint()
        configureTargets()
    }
    
    open func configureView() {}
    open func configureConstraint() {}
    open func configureTargets() {}

}
