//
//  WinnerMedalImageView.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/18.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class WinnerMedalImageView: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        super.init(image: nil)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init() {
        self.init(image: UIImage(named: "trophy.png"))
    }

    override func updateConstraints() {
        super.updateConstraints()
        self.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

