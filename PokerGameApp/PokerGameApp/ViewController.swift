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
        startPorkerGame(gameMode: mode, numberOfPlayer: numberOfPlayers)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

private extension ViewController {
    func startPorkerGame(gameMode: PokerGame.Mode, numberOfPlayer: Int) {
        self.pokerGame.start(gameMode: gameMode, numberOfPlayer: numberOfPlayer) { players in
            self.setPokerGameView(data: players)
            players.resetPlayers()
        }
    }

    func setPokerGameView(data players: Players) {
        self.playerView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        players.forEachPlayers { player in
            self.pokerGameView.addArrangedSubview(makePlayerView(data: player))
        }
        self.view.addSubview(self.pokerGameView)
        pokerGameView.setConstraint(superView: self.view, segmentedControl: segmentedControl)
    }

    func makePlayerView(data player: Playable) -> PlayerView {
        playerView.addArrangedSubview(makePlayerNameLabel(data: player.name))
        playerView.addArrangedSubview(makeHandView(data: player.makeHand()))
        
        return playerView
    }

    func makeHandView(data hand: [UIImageView]) -> HandView {
        let handView = HandView(arrangedSubviews: hand)
        
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
        case 1:
            mode = .fiveStud
        default: break
        }
        startPorkerGame(gameMode: mode, numberOfPlayer: self.numberOfPlayers)
    }
    
    func numberOfPlayersChanged(selectecdSegmentIndex: Int) {
        startPorkerGame(gameMode: self.mode, numberOfPlayer: PokerGame.NumberOfPalyer.init(rawValue: selectecdSegmentIndex + 2)?.rawValue ?? 2)
    }
}
