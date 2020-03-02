//
//  GameSegmentedControlStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol GameSegmentedControlStackViewDelegate: class {
    
    func segmentedControlIndexChanged(gameStut: GameStut,
                                      playersNum: Participants.PlayersNum)
    
}

class GameSegmentedControlStackView: UIStackView {
    
    weak var delegate: GameSegmentedControlStackViewDelegate?
    let stutSegmentedControl = GameSegmentedControl(items:
        GameStut.allCases.map { $0.description + " Cards"})
    let playersSegmentedControl = GameSegmentedControl(items:
        Participants.PlayersNum.allCases.map{ $0.description + "명"})
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        setupProperties()
        setupSegmentedControls()
        addSegmentedControls()
    }
    
    private func setupProperties(){
        axis = .vertical
        distribution = .fillEqually
        spacing = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSegmentedControls() {
        addTargets()
    }
    
    private func addTargets() {
        stutSegmentedControl.addTarget(self,
                                       action: #selector(indexChanged(_:)),
                                       for: .valueChanged)
        playersSegmentedControl.addTarget(self,
                                          action: #selector(indexChanged(_:)),
                                          for: .valueChanged)
    }
    
    private func addSegmentedControls() {
        addArrangedSubview(stutSegmentedControl)
        addArrangedSubview(playersSegmentedControl)
    }
    
    @objc private func indexChanged(_ sender: UISegmentedControl) {
        guard let gameStut = gameStut() , let playersNum = playersNum() else {
            return
        }
        delegate?.segmentedControlIndexChanged(gameStut: gameStut, playersNum: playersNum)
    }
    
    func gameStut() -> GameStut? {
        let index = stutSegmentedControl.selectedSegmentIndex
        let stuts = GameStut.allCases
        guard Controller.verifyIndex(index: index, arrLen: stuts.count) else {
            return nil
        }
        return stuts[index]
    }
    
    func playersNum() -> Participants.PlayersNum? {
        let index = playersSegmentedControl.selectedSegmentIndex
        let playerNums = Participants.PlayersNum.allCases
        guard Controller.verifyIndex(index: index, arrLen: playerNums.count) else {
            return nil
        }
        return playerNums[index]
    }
    
}
