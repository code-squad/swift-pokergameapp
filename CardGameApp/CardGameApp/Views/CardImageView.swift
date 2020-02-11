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
        
        setupUI()
    }
    
    private func setupUI() {
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.27).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
