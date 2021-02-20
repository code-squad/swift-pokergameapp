//
//  nameView.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/18.
//

import UIKit


class NameLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        self.font = UIFont.preferredFont(forTextStyle: .headline)
        self.textColor = .label
    }
}
