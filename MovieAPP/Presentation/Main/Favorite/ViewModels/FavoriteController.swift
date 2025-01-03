//
//  FavoriteController.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 30.12.24.
//
import Foundation

final class FavoriteController:CoreController {
    private let viewModel:FavoriteViewModel
    init(viewModel: FavoriteViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .fonColor9
    }
}
