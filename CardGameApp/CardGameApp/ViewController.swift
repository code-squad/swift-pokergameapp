//
//  ViewController.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

extension ViewController: GameSegmentedControlStackViewDelegate {
    
    func segmentedControlIndexChanged(gameStut: GameStut,
                                      playersNumber: Participants.PlayersNumber) {
        startNewGame(gameStut: gameStut,
                  participants: Participants(playersNumber: playersNumber))
    }
    
    private func startNewGame(gameStut: GameStut, participants: Participants) {
        shuffleDeck()
        game = PokerGame(gameStut: gameStut,
                             participants: participants, deck: deck)
        
        if !game.hasEnoughCards() {
            game = resetDeckAndGenerateGame(gameStut: gameStut,
                                            participants: participants)
        }
        game.startNewRound()
        participantsStackView.updateView(game: game)
    }
    
    private func resetDeckAndGenerateGame(gameStut: GameStut, participants: Participants) -> PokerGame {
        deck.reset()
        shuffleDeck()
        return PokerGame(gameStut: gameStut,
                         participants: participants,
                         deck: deck)
    }
    
}

extension ViewController {
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            startNewRound()
        }
    }
    
    private func startNewRound() {
        if !game.hasEnoughCards() {
            game = resetDeckAndGenerateGame(gameStut: game.gameStut,
                                            participants: game.participants)
        }
        game.startNewRound()
        participantsStackView.updateView(game: game)
    }
    
}

class ViewController: UIViewController {
    
    private var game: PokerGame!
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
        startNewGame(gameStut: .seven,
                  participants: Participants(playersNumber: .one))
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
        let safeArea = view.safeAreaLayoutGuide
        gameSegmentedControlStackView.topAnchor.constraint(equalTo:
            safeArea.topAnchor).isActive = true
        gameSegmentedControlStackView.centerXAnchor.constraint(equalTo:
            safeArea.centerXAnchor).isActive = true
    }
    
    private func setupPaticipantsStackView() {
        participantsStackView = ParticipantsStackView()
        self.view.addSubview(participantsStackView)
        setConstraintParticipantsStackView()
    }
    
    private func setConstraintParticipantsStackView() {
        let safeArea = view.safeAreaLayoutGuide
        let leadingConstant: CGFloat = 30
        let trailingConstant: CGFloat = 57
        participantsStackView.topAnchor.constraint(
            equalTo:gameSegmentedControlStackView.bottomAnchor).isActive = true
        participantsStackView.leadingAnchor.constraint(
            equalTo: safeArea.leadingAnchor, constant: leadingConstant).isActive = true
        participantsStackView.trailingAnchor.constraint(
            equalTo: safeArea.trailingAnchor, constant: -trailingConstant).isActive = true
    }
    
    private var generator = ANSI_C_RandomNumberGenerator()
    private func shuffleDeck() {
        deck.shuffle(using: &generator)
    }
    
}
