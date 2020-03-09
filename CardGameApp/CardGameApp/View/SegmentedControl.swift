//
//  SegmentedControl.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/03/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import UIKit

protocol SegmentedControlProtocol: class {
    func segmentControlDidChange()
}

class SegmentedControl : UIView{
    weak var delegate : SegmentedControlProtocol?
    let gameModes: [String] = ["5 Cards","7 Cards"]
    let numbersOfPlayersList: [String] = ["2명", "3명", "4명"]
    private lazy var gameModeSegmentControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: gameModes)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    private lazy var numbersOfPlayersSegmentedControl : UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: numbersOfPlayersList)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    @objc func valueDidChange(){
        delegate?.segmentControlDidChange()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private func setUpView(){
        self.addSubview(gameModeSegmentControl)
        self.addSubview(numbersOfPlayersSegmentedControl)
        gameModeSegmentControl.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
        numbersOfPlayersSegmentedControl.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
        
        topAnchor.constraint(equalTo: gameModeSegmentControl.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: gameModeSegmentControl.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: gameModeSegmentControl.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: numbersOfPlayersSegmentedControl.bottomAnchor).isActive = true
        
        numbersOfPlayersSegmentedControl.widthAnchor.constraint(equalTo: gameModeSegmentControl.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 65).isActive = true
        gameModeSegmentControl.selectedSegmentIndex = 0
        numbersOfPlayersSegmentedControl.selectedSegmentIndex = 0
    }
}
