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
        image = #imageLiteral(resourceName: "winner")
        alpha = 0
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 28).isActive = true
        heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
}
