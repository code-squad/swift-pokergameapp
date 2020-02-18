//
//  WinnerCrownImageView.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class WinnerCrownImageView: UIImageView {
    init() {
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
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 28).isActive = true
        heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
}
