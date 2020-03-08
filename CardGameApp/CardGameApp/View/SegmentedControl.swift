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

class GameModeSegmentedControl : UISegmentedControl{
    
    private var gameMode = GameMode.fiveCardStud
    let gameModes: [String] = ["5 Cards","7 Cards"]
    var gameModeSegmentControl = UISegmentedControl()
    
    weak var delegate : SegmentedControlProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gameModeSegmentControl = UISegmentedControl(items: gameModes)
        self.addTarget(self, action:
            #selector(valueDidChange),
                       for: .valueChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    func setSegmetedControl(in view: UIView, offset: CGFloat){
        self.center = CGPoint(x: view.frame.width/2, y: view.frame.height/offset)
        self.backgroundColor = UIColor.gray
        self.tintColor = UIColor.white
    }
    
    @objc func valueDidChange(){
        delegate?.segmentControlDidChange()
    }
}

class NumbersOfPlayersSegmentedControl: UISegmentedControl {
    private var numbersOfPlayers = NumbersOfPlayers.four
    let numbersOfPlayersList: [String] = ["2명", "3명", "4명"]
    var numbersOfPlayersSegmentControl = UISegmentedControl()
    
    weak var delegate : SegmentedControlProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        numbersOfPlayersSegmentControl = UISegmentedControl(items: numbersOfPlayersList)
        numbersOfPlayersSegmentControl.addTarget(self, action: #selector(valueDidChange),
            for: .valueChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    func setSegmetedControl(in view: UIView, offset: CGFloat){
        self.center = CGPoint(x: view.frame.width/2, y: view.frame.height/offset)
        self.backgroundColor = UIColor.gray
        self.tintColor = UIColor.white
    }
    
    @objc func valueDidChange(){
        delegate?.segmentControlDidChange()
    }
}
