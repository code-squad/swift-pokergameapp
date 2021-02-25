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
    private var playerWithWinnerView = PlayerWithWinnerView()
    private var winner: Playable?

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
            self.pokerGame.findWinner(players: players) { playable in
                self.winner = playable
                self.setPokerGameView(data: players)
                players.resetPlayers()
            }
        }
    }

    func setPokerGameView(data players: Players) {
        self.playerView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        players.forEachPlayers { player in
            self.pokerGameView.addArrangedSubview(makePlayerWithWinnerView(data: player))
        }
        self.view.addSubview(self.pokerGameView)
        pokerGameView.setConstraint(superView: self.view, segmentedControl: segmentedControl)
    }
    
    func makePlayerWithWinnerView(data player: Playable) -> PlayerWithWinnerView {
        if player.name == winner?.name {
            return PlayerWithWinnerView(arrangedSubviews: [makePlayerView(data: player), makeWinnerView()])
        } else {
            return PlayerWithWinnerView(arrangedSubviews: [makePlayerView(data: player)])
        }
    }

    func makePlayerView(data player: Playable) -> PlayerView {
        playerView.addArrangedSubview(makePlayerNameLabel(data: player.name))
        playerView.addArrangedSubview(makeHandView(data: makeCardImages(data: player)))
        
        return playerView
    }

    func makeHandView(data hand: [UIImageView]) -> HandView {
        let handView = HandView(arrangedSubviews: hand)
        
        return handView
    }
    
    func makeWinnerView() -> UIImageView {
        return CrownImage.image(CrownImage.crown)
    }

    func makePlayerNameLabel(data name: String) -> UILabel {
        let nameLabel = NameLabel()
        nameLabel.text = name
        return nameLabel
    }
    
    func makeCardImages(data player: Playable) -> [UIImageView] {
        var cardImages: [UIImageView] = []
        
        player.forEachPlayer { hand in
            hand.forEachHand { card in
                let cardImage = CardImage.image(card.description)
                cardImages.append(cardImage)
            }
        }
    
        return cardImages
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
        startPorkerGame(gameMode: self.mode, numberOfPlayer: PokerGame.NumberOfPalyer.init(rawValue: selectecdSegmentIndex + 2)?.rawValue ?? Int())
    }
}
