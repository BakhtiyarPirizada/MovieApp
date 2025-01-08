//
//  ReusableText.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//

import UIKit
final class ReusableText: UITextField, UITextFieldDelegate {
    private var title: String
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI() {
        backgroundColor = .fonColor8
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.buttonColor1.cgColor
        placeholder = title
        textColor = .black
        borderStyle = .none
        delegate = self
        setLeftPadding(8)
        layer.cornerRadius = 8
    }
}
