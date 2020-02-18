//
//  CardImageView.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/17.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class CardImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init(coder: NSCoder) {
        super.init(image: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 3.0
        self.clipsToBounds = true
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.27).isActive = true
    }
}
