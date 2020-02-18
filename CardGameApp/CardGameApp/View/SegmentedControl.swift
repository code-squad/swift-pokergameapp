//
//  SegmentedControl.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/18.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class SegmentedControl: UISegmentedControl {
    
    required init(items: [String]) {
        super.init(items: items)
        self.setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    private func setUp() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.selectedSegmentIndex = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))], for: .selected)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
    }
}
