//
//  GameSegmentControl.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class GameSegmentedControl: UISegmentedControl {
    
    override init(items: [Any]?) {
        super.init(items: items)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        setupSegmentIndex()
        setupTitle()
    }
    
    private func setupSegmentIndex() {
        selectedSegmentIndex = .zero
    }
    
    private func setupTitle() {
        setNormalTextColor(UIColor.white)
        setSelectedTextColor(UIColor.black)
    }
    
    private func setNormalTextColor(_ color: UIColor) {
        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        setTitleTextAttributes(normalTextAttributes, for: .normal)
    }
    
    private func setSelectedTextColor(_ color: UIColor) {
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        setTitleTextAttributes(selectedTextAttributes, for: .selected)
    }
    
}
