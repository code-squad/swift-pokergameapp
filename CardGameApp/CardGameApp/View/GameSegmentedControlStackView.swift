//
//  GameSegmentedControlStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol GameSegmentedControlDelegate: class {
    func segmentedControlIndexChanged(stut: PokerGame.GameStut,
                                      players: Players.PlayersNum)
}

class GameSegmentedControlStackView: UIStackView {
    weak var delegate: GameSegmentedControlDelegate?
    
    let stutSegmentedControl = GameSegmentedControl(items:
        PokerGame.GameStut.allCases.map { $0.description })
    let playersSegmentedControl = GameSegmentedControl(items:
        Players.PlayersNum.allCases.map{ $0.description })
    
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
        guard let stut = stut() , let playersNum = playersNum() else {
            return
        }
        delegate?.segmentedControlIndexChanged(stut: stut, players: playersNum)
    }
    
    private func stut() -> PokerGame.GameStut? {
        let index = stutSegmentedControl.selectedSegmentIndex
        switch index {
        case 0:
            return PokerGame.GameStut.five
        case 1:
            return PokerGame.GameStut.seven
        default:
            return nil
        }
    }
    
    private func playersNum() -> Players.PlayersNum? {
        let index = playersSegmentedControl.selectedSegmentIndex
        switch index {
        case 0:
            return Players.PlayersNum.one
        case 1:
            return Players.PlayersNum.two
        case 2:
            return Players.PlayersNum.three
        case 3:
            return Players.PlayersNum.four
        default:
            return nil
        }
    }
}
