//
//  CardImageView.swift
//  CardGameApp
//
//  Created by Elena on 28/10/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class CardImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.image = UIImage(named: "card-back")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
