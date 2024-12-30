//
//  HomeController.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 23.12.24.
//

import UIKit

class HomeController: CoreController {
    private let viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.type = .week
        
    }
}

