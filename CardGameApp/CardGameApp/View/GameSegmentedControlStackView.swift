//
//  GameSegmentedControlStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol GameSegmentedControlStackViewDelegate: class {
    func segmentedControlIndexChanged(gameStut: PokerGame.GameStut,
                                      playersNum: Players.Number)
}

class GameSegmentedControlStackView: UIStackView {
    weak var delegate: GameSegmentedControlStackViewDelegate?
    
    let stutSegmentedControl = GameSegmentedControl(items:
        PokerGame.GameStut.allCases.map { $0.description })
    let playersSegmentedControl = GameSegmentedControl(items:
        Players.Number.allCases.map{ $0.description })
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    private func gameStut() -> PokerGame.GameStut? {
        let index = stutSegmentedControl.selectedSegmentIndex
        switch index {
        case 0:
            return PokerGame.GameStut.seven
        case 1:
            return PokerGame.GameStut.five
        default:
            return nil
        }
    }
    
    private func playersNum() -> Players.Number? {
        let index = playersSegmentedControl.selectedSegmentIndex
        switch index {
        case 0:
            return Players.Number.one
        case 1:
            return Players.Number.two
        case 2:
            return Players.Number.three
        case 3:
            return Players.Number.four
        default:
            return nil
        }
    }
}
