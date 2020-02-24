//
//  FirstView.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit

final class GameTableView: UIView {
    
    private var stackView: StackView = StackView()
    private let viewBackground: String = "bg_pattern"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        apply(background: viewBackground)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        apply(background: viewBackground)
    }
    
    private func apply(background: String) {
        backgroundColor = UIColor(patternImage: UIImage(named: background) ?? UIImage())
    }
}
