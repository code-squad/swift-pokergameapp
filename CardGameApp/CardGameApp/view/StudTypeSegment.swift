//
//  StudTypeSegment.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/25.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

class StudTypeSegmentedControl: UISegmentedControl {
    
    override init(items: [Any]?) {
        super.init(items: items)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.selectedSegmentIndex = 0
    }
}
