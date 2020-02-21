//
//  GameSegmentControl.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol GameSegmentedControlDelegate: class {
    func indexChanged(index : Int)
}


class GameSegmentedControl: UISegmentedControl {
    
    weak var delegate: GameSegmentedControlDelegate?
    
    init(items: [String], delegate: GameSegmentedControlDelegate) {
        super.init(items : items)
        self.delegate = delegate
        configure()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSegmentIndex()
        setupTitle()
        setAddTarget()
    }
    
    private func setupSegmentIndex() {
        selectedSegmentIndex = .zero
    }
    
    private func setupTitle() {
        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setTitleTextAttributes(normalTextAttributes, for: .normal)
        
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        setTitleTextAttributes(selectedTextAttributes, for: .selected)
    }
    
    private func setAddTarget() {
        addTarget(self, action: #selector(indexChanged), for: .valueChanged)
    }
    
    @objc private func indexChanged(_ sender: UISegmentedControl) {
        delegate?.indexChanged(index: sender.selectedSegmentIndex)
    }
}
