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
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
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
