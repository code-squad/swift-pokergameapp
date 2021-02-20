//
//  ViewController.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    private var pokerGame = PokerGame()
    private var pokerGameView = PokerGameView()
    private let segmentedControl = PokerGameSegmentedControl()
    private var mode = PokerGame.Mode.sevenStud
    private var numberOfPlayers = 4
    private var playerView = PlayerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: CardImage.background) ?? UIImage())
        setSegmentedContrl()
        segmentedControl.delegate = self
        startPorkerGame(gameMode: mode, NumberOfPlayer: numberOfPlayers)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

private extension ViewController {
    func startPorkerGame(gameMode: PokerGame.Mode, NumberOfPlayer: Int) {
        self.pokerGame.start(gameMode: gameMode, NumberOfPlayer: NumberOfPlayer) { players in
            self.pokerGame.resetPlayers()
            self.setPokerGameView(data: players)
        }
    }

    func setPokerGameView(data players: Players) {
        self.playerView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        players.getPlayersInfo().forEach { player in
            self.pokerGameView.addArrangedSubview(makePlayerView(data: player))
        }
        
        self.pokerGameView.addArrangedSubview(makeDealerView(data: players.getDealerInfo()))
        self.view.addSubview(self.pokerGameView)
        pokerGameView.setConstraint(superView: self.view, segmentedControl: segmentedControl)
    }

    func makePlayerView(data player: Player) -> PlayerView {
        playerView.addArrangedSubview(makePlayerNameLabel(data: player.getNameInfo()))
        playerView.addArrangedSubview(makeHandView(data: player.getHandInfo()))
        
        return playerView
    }

    func makeDealerView(data dealer: Dealer) -> PlayerView {
        playerView.addArrangedSubview(makePlayerNameLabel(data: dealer.getNameInfo()))
        playerView.addArrangedSubview(makeHandView(data: dealer.getHandInfo()))
        
        return playerView
    }

    func makeHandView(data hand: Hand) -> HandView {
        let handView = HandView()
        let hand = hand.getHand()
        
        hand.forEach { cardInfo in
            let card = CardImage.image(cardInfo.description)
            handView.addArrangedSubview(card)
        }
        
        return handView
    }

    func makePlayerNameLabel(data name: String) -> UILabel {
        let nameLabel = NameLabel()
        nameLabel.text = name
        return nameLabel
    }
    
    func setSegmentedContrl() {
        self.view.addSubview(segmentedControl)
        
        let safeArea = view.safeAreaLayoutGuide
        segmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
    }
}

extension ViewController: ChangePokerGameDelegate {
    func modeSegmentControlDidChange(changedValue: Int) {
        let mode = changedValue
        modeChanged(selectedSegmentIndex: mode)
    }
    
    func numbersOfPlayersSegmentControlDidChange(changedValue: Int) {
        let numberOfPlayers = changedValue
        numberOfPlayersChanged(selectecdSegmentIndex: numberOfPlayers)
    }
    
    func modeChanged(selectedSegmentIndex: Int) {
        switch selectedSegmentIndex {
        case 0:
            mode = .sevenStud
            startPorkerGame(gameMode: mode, NumberOfPlayer: self.numberOfPlayers)
        case 1:
            mode = .fiveStud
            startPorkerGame(gameMode: mode, NumberOfPlayer: self.numberOfPlayers)
        default: return
        }
    }
    
    func numberOfPlayersChanged(selectecdSegmentIndex: Int) {
        switch selectecdSegmentIndex {
        case 0:
            numberOfPlayers = 2
            startPorkerGame(gameMode: self.mode, NumberOfPlayer: numberOfPlayers)
        case 1:
            numberOfPlayers = 3
            startPorkerGame(gameMode: self.mode, NumberOfPlayer: numberOfPlayers)
        case 2:
            numberOfPlayers = 4
            startPorkerGame(gameMode: self.mode, NumberOfPlayer: numberOfPlayers)
        default: return
        }
    }
}
