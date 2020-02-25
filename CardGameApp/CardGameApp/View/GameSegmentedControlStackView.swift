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
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure(){
        setup()
        addSegmentedControls()
        setAddTargets()
    }
    
    private func setup(){
        axis = .vertical
        distribution = .fillEqually
        spacing = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSegmentedControls() {
        addArrangedSubview(stutSegmentedControl)
        addArrangedSubview(playersSegmentedControl)
    }
    
    private func setAddTargets() {
        stutSegmentedControl.addTarget(self,
                                       action: #selector(indexChanged(_:)),
                                       for: .valueChanged)
        playersSegmentedControl.addTarget(self,
                                          action: #selector(indexChanged(_:)),
                                          for: .valueChanged)
    }
    
    @objc private func indexChanged(_ sender: UISegmentedControl) {
        guard let gameStut = gameStut() , let playersNum = playersNum() else {
            return
        }
        delegate?.segmentedControlIndexChanged(gameStut: gameStut, playersNum: playersNum)
    }
    
    func gameStut() -> GameStut? {
        let index = stutSegmentedControl.selectedSegmentIndex
        return GameStut.allCases[index]
    }
    
    func playersNum() -> Participants.PlayersNum? {
        let index = playersSegmentedControl.selectedSegmentIndex
        return Participants.PlayersNum.allCases[index]
    }
}
