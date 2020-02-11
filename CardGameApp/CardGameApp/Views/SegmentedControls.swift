//
//  SegmentedControls.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/11.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class GameTypeSegmentedControl: UISegmentedControl {
    private var items: [String]?
    
    init(items: [String]) {
        self.items = items
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupItems()
        selectedSegmentIndex = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupItems() {
        items?.enumerated().forEach { (index, item) in
            insertSegment(withTitle: item, at: index, animated: false)
        }
    }
}

class SegmentedControlStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        axis = .vertical
        spacing = 8
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
}
