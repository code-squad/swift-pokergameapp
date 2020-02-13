//
//  SegmentedControlStackView.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/11.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

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
