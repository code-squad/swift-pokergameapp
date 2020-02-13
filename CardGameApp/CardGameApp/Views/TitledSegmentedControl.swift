//
//  TitledSegmentedControl.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/12.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class TitledSegmentedControl: UISegmentedControl {
    private var items: [String]?
    
    init(items: [String]) {
        self.items = items
        super.init(frame: .zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
