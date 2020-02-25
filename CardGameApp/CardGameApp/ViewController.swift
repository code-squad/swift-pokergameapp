//
//  ViewController.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

extension ViewController: GameSegmentedControlStackViewDelegate {
    func segmentedControlIndexChanged(gameStut: PokerGame.GameStut,
                                      playersNum: PokerGame.ParticipantsNum.PlayersNum) {
        startGame(gameStut: gameStut,
                  participantsNum: PokerGame.ParticipantsNum(playersNum: playersNum))
    }
}

extension ViewController {
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            guard let gameStut = gameSegmentedControlStackView.gameStut() else {
                return
            }
            guard let playersNum = gameSegmentedControlStackView.playersNum() else {
                return
            }
            startGame(gameStut: gameStut,
                      participantsNum: PokerGame.ParticipantsNum(playersNum: playersNum))
        }
    }
}

class ViewController: UIViewController {
    
    private var deck = Deck()
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
                  participantsNum: PokerGame.ParticipantsNum(playersNum: .one) )
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
    
    private func startGame(gameStut: PokerGame.GameStut, participantsNum: PokerGame.ParticipantsNum) {
        shuffleDeck()
        var game = PokerGame(gameStut: gameStut, participantsNum: participantsNum, deck: deck)
        if !game.hasEnoughCards() {
            deck.reset()
            shuffleDeck()
            game = PokerGame(gameStut: gameStut, participantsNum: participantsNum, deck: deck)
        }
        game.startNewRound()
        participantsStackView.updateView(game: game)
    }
    
    private var generator = ANSI_C_RandomNumberGenerator()
    private func shuffleDeck() {
        deck.shuffle(using: &generator)
    }
}
