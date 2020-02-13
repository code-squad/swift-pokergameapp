//
//  CardImageView.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/11.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class CardImageView: UIImageView {
    init(named: String) {
        let image = UIImage(named: named)
        super.init(image: image)
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
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.27).isActive = true
    }
}
