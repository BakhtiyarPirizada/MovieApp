//
//  RegisterController.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//
import UIKit

final class RegisterController: CoreController {
    
    private let viewModel:RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
