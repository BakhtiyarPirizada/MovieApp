//
//  ReusableLabel.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//

import UIKit
final class ReusableLabel:UILabel {
    private var title: String
    private var size: CGFloat
    init(title: String,size:CGFloat) {
        self.size = size
        self.title = title
        super.init(frame: .zero)
        ConfigureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func ConfigureUI() {
        text = title
        textAlignment = .center
        numberOfLines = 0
        textColor = .black
    }
}
