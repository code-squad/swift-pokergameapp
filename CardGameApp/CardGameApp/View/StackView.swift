//
//  File.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/24.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit

class StackView: UIView {
    
    private var game: Game!
    private var stackView: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(stackView)
    }
}
