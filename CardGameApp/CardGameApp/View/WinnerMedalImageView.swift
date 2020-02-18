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
        self.setUp()
    }
    
    required init(coder: NSCoder) {
        super.init(image: nil)
        self.setUp()
    }
    
    convenience init() {
        self.init(image: UIImage(named: "trophy.png"))
    }
    
    private func setUp() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    override func updateConstraints() {
        super.updateConstraints()
        self.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

