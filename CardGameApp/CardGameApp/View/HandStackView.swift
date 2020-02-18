//
//  HandStackView.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/17.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class HandStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.distribution = .fillEqually
        self.spacing = -5
    }
}
