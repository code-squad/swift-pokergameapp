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
        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setTitleTextAttributes(normalTextAttributes, for: .normal)
        
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        setTitleTextAttributes(selectedTextAttributes, for: .selected)
    }
    
}
