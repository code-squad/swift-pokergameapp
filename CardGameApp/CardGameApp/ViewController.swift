//
//  ViewController.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

extension ViewController: GameSegmentedControlDelegate {
    func segmentedControlIndexChanged(stut: PokerGame.GameStut, players: Players.Number) {
        
    }
}

class ViewController: UIViewController {
    
    private var gameSegmentedControlStackView: GameSegmentedControlStackView!
    private var participantsStackView: ParticipantsStackView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupSegmentedControlsStackView()
        setupPaticipantsStackView()
        startGame(gameStut: .seven,
                  playersNum: .one)
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
    }
    
    private func setupSegmentedControlsStackView() {
        gameSegmentedControlStackView = {
           let stackView = GameSegmentedControlStackView()
            stackView.delegate = self
           return stackView
        }()
        self.view.addSubview(gameSegmentedControlStackView)
        setConstraintControlsStackView()
    }
    
    private func setConstraintControlsStackView() {
        let topConstant: CGFloat = 10
        let sideConstant: CGFloat = 120
        gameSegmentedControlStackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: topConstant).isActive = true
        gameSegmentedControlStackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: sideConstant).isActive = true
        gameSegmentedControlStackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -sideConstant).isActive = true
    }
    
    private func setupPaticipantsStackView() {
        participantsStackView = ParticipantsStackView()
        self.view.addSubview(participantsStackView)
        setConstraintParticipantsStackView()
    }
    
    private func setConstraintParticipantsStackView() {
        let topConstant: CGFloat = 40
        let leadingConstant: CGFloat = 30
        let trailingConstant: CGFloat = 50
        participantsStackView.topAnchor.constraint(
            equalTo: gameSegmentedControlStackView.bottomAnchor,
            constant: topConstant).isActive = true
        participantsStackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: leadingConstant).isActive = true
        participantsStackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -trailingConstant).isActive = true
    }
    
    private func startGame(gameStut: PokerGame.GameStut, playersNum: Players.Number) {
        let game = PokerGame(gameStut: gameStut, playersNum: playersNum)
        participantsStackView.updateView(gameStut: gameStut, playersNum: playersNum)
    }
}
