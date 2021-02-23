//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var deckForTest = CardDeck()
    var deckForGame = CardDeck()
    
    let segmentedControlStackView = UIStackView()
    let gameTypeSegmentedControl = UISegmentedControl()
    let numberOfPlayersSegmentedControl = UISegmentedControl()
    let playerStackView = UIStackView()
    
    var currentGameSize = PokerGame.Size.twoPlayers
    var currentGameType = PokerGame.StudPoker.sevenCardStud
    lazy var dealer = Dealer(cardDeck: deckForGame)
    lazy var players = Players(numberOfPlayers: currentGameSize)
    lazy var pokerGame = PokerGame(dealer: dealer, players: players, gameType: currentGameType)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testScenarios()
        
        if let backgroundImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        resetPlayerStackView()
        
        setProperties(of: segmentedControlStackView, axis: .vertical)
        segmentedControlStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        setConstraints(of: segmentedControlStackView, padding: 100.0)
        
        gameTypeSegmentedControl.insertSegment(withTitle: PokerGame.StudPoker.sevenCardStud.description, at: 0, animated: true)
        gameTypeSegmentedControl.insertSegment(withTitle: PokerGame.StudPoker.fiveCardStud.description, at: 1, animated: true)
        setProperties(of: gameTypeSegmentedControl)
        gameTypeSegmentedControl.addTarget(self, action: #selector(gameTypeChanged(_:)), for: .valueChanged)
        
        numberOfPlayersSegmentedControl.insertSegment(withTitle: PokerGame.Size.twoPlayers.description, at: 0, animated: true)
        numberOfPlayersSegmentedControl.insertSegment(withTitle: PokerGame.Size.threePlayers.description, at: 1, animated: true)
        numberOfPlayersSegmentedControl.insertSegment(withTitle: PokerGame.Size.fourPlayers.description, at: 2, animated: true)
        setProperties(of: numberOfPlayersSegmentedControl)
        numberOfPlayersSegmentedControl.addTarget(self, action: #selector(numberOfPlayersChanged(_:)), for: .valueChanged)
        
        setProperties(of: playerStackView, axis: .vertical)
        playerStackView.distribution = .equalSpacing
        playerStackView.topAnchor.constraint(equalTo: segmentedControlStackView.bottomAnchor, constant: 5).isActive = true
        playerStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        setConstraints(of: playerStackView, padding: 0)
    }
    
    @objc func gameTypeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentGameType = .sevenCardStud
        case 1:
            currentGameType = .fiveCardStud
        default:
            break
        }
        resetPlayerStackView()
    }
    
    @objc func numberOfPlayersChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentGameSize = PokerGame.Size.twoPlayers
        case 1:
            currentGameSize = PokerGame.Size.threePlayers
        case 2:
            currentGameSize = PokerGame.Size.fourPlayers
        default:
            break
        }
        resetPlayerStackView()
    }
    
    func clearPlayerStackView() {
        playerStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func updateGameInfo() -> PokerGame {
        let newDeck = CardDeck()
        dealer = Dealer(cardDeck: newDeck)
        players = Players(numberOfPlayers: currentGameSize)
        pokerGame = PokerGame(dealer: dealer, players: players, gameType: currentGameType)
        pokerGame.startGame()
        return pokerGame
    }
    
    func updatePlayerStackView(for game: PokerGame) {
        players.showPlayers {
            playerStackView.addArrangedSubview(CardInfoStackView(participant: $0))
        }
        playerStackView.addArrangedSubview(CardInfoStackView(participant: dealer))
    }
    
    func setProperties(of stackView: UIStackView, axis: NSLayoutConstraint.Axis) {
        self.view.addSubview(stackView)
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5.0
    }
    
    func setProperties(of segmentedControl: UISegmentedControl) {
        segmentedControlStackView.addArrangedSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
    }
    
    func setConstraints(of view: UIView, padding: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: padding).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -padding).isActive = true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            resetPlayerStackView()
        }
    }
    
    func resetPlayerStackView() {
        clearPlayerStackView()
        pokerGame = updateGameInfo()
        updatePlayerStackView(for: pokerGame)
    }
    
    func testScenarios() {
        print(Test(testCase: .create, testDeck: deckForTest, expectedValue: 52))
        deckForTest.shuffle()
        print(Test(testCase: .shuffle, testDeck: deckForTest, expectedValue: 52))
        let _ = deckForTest.removeOne()
        print(Test(testCase: .removeOne, testDeck: deckForTest, expectedValue: 51))
        deckForTest.reset()
        print(Test(testCase: .reset, testDeck: deckForTest, expectedValue: 52))
    }
}
