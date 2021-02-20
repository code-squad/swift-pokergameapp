//
//  SegmentedControl.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/18.
//

import UIKit

protocol ChangePokerGameDelegate: class {
    func modeSegmentControlDidChange(changedValue: Int)
    func numbersOfPlayersSegmentControlDidChange(changedValue: Int)
}

class PokerGameSegmentedControl: UISegmentedControl {
    private let modeSegmentedControl: UISegmentedControl = {
        let studsItems = PokerGame.Mode.allCases.map { $0.rawValue }
        let segmentedControl = UISegmentedControl(items: studsItems)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(modeValueDidChange), for: .valueChanged)
        return segmentedControl
    }()
    
    private let numbersOfPlayersSegmentedControl: UISegmentedControl = {
        let numbersOfPlayersItems = PokerGame.NumberOfPalyer.allCases.map { $0.rawValue }
        let segmentedControl = UISegmentedControl(items: numbersOfPlayersItems)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 2
        segmentedControl.addTarget(self, action: #selector(numbersOfPlayersValueDidChange), for: .valueChanged)
        return segmentedControl
    }()
    
    weak var delegate : ChangePokerGameDelegate?
    
    @objc func modeValueDidChange() {
        delegate?.modeSegmentControlDidChange(changedValue: modeSegmentedControl.selectedSegmentIndex)
    }
    
    @objc func numbersOfPlayersValueDidChange() {
        delegate?.numbersOfPlayersSegmentControlDidChange(changedValue: numbersOfPlayersSegmentedControl.selectedSegmentIndex)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    convenience init() {
        self.init(frame: .zero)
        configure()
    }
    
    private func configure(){
        self.addSubview(modeSegmentedControl)
        self.addSubview(numbersOfPlayersSegmentedControl)
        
        topAnchor.constraint(equalTo: modeSegmentedControl.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: modeSegmentedControl.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: modeSegmentedControl.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: numbersOfPlayersSegmentedControl.bottomAnchor).isActive = true
        numbersOfPlayersSegmentedControl.widthAnchor.constraint(equalTo: modeSegmentedControl.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
