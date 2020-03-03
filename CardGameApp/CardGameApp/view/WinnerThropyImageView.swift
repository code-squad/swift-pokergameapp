//
//  WinnerThropyImageView.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/03/04.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

class WinnerThropyImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
