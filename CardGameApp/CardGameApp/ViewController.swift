//
//  ViewController.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var pokerGame = PokerGame(numbersOfPlayers: .four, gameMode: .fiveCardStud)
    private var gameMode = GameMode.fiveCardStud
    private var numbersOfPlayers = NumbersOfPlayers.four
    
    // MARK: - Properties
    // StackView
    func makeCardsStackView() -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = -15
        return horizontalStackView
    }
    
    let gameStackView: UIStackView = {
        let gameStackView = UIStackView()
        gameStackView.translatesAutoresizingMaskIntoConstraints = false
        gameStackView.axis = .vertical
        gameStackView.spacing = 5
        return gameStackView
    }()
    
    func makeParticipantStackView() -> UIStackView {
        let playerStackView = UIStackView()
        playerStackView.translatesAutoresizingMaskIntoConstraints = false
        playerStackView.axis = .vertical
        playerStackView.distribution = .equalSpacing
        playerStackView.alignment = .fill
        playerStackView.spacing = 15
        return playerStackView
    }
    
    // SegmentedControl
    // - GameMode
    let gameModes: [String] = ["5 Cards","7 Cards"]
    
    lazy var gameModeSegmentControl: UISegmentedControl = {
        let gameModeSegmentControl: UISegmentedControl = UISegmentedControl(items: gameModes)
        
        gameModeSegmentControl.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/15)
        gameModeSegmentControl.backgroundColor = UIColor.gray
        gameModeSegmentControl.tintColor = UIColor.white
        gameModeSegmentControl.addTarget(self, action:
            #selector(gameModeSegmentChanged(segmentedControl:)),
                                         for: .valueChanged)
        //        gameModeSegmentControl.selectedSegmentIndex = 0
        return gameModeSegmentControl
    }()
    
    // - Players
    let numbersOfPlayersList: [String] = ["2명", "3명", "4명"]
    
    lazy var numbersOfPlayersSegmentControl: UISegmentedControl = {
        let numbersOfPlayersSegmentControl: UISegmentedControl = UISegmentedControl(items: numbersOfPlayersList)
        numbersOfPlayersSegmentControl.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/9)
        numbersOfPlayersSegmentControl.backgroundColor = UIColor.gray
        numbersOfPlayersSegmentControl.tintColor = UIColor.white
        numbersOfPlayersSegmentControl.addTarget(self, action:
            #selector(numbersOfPlayersSegmentChanged(segmentedControl:)),
                                                 for: .valueChanged)
        //        numbersOfPlayersSegmentControl.selectedSegmentIndex = 0
        return numbersOfPlayersSegmentControl
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:  #imageLiteral(resourceName: "bg_pattern"))
        self.view.addSubview(gameModeSegmentControl)
        self.view.addSubview(numbersOfPlayersSegmentControl)
    }
    
    func startPokerGame(gameMode : GameMode, numbersOfPlayers : NumbersOfPlayers){
        gameStackView.subviews.forEach{$0.removeFromSuperview()}
        pokerGame = PokerGame.init(numbersOfPlayers: numbersOfPlayers, gameMode: gameMode)
        pokerGame.start()
        pokerGame.shuffleWholeCardDeck()
        self.view.addSubview(gameStackView)
        setConstraintOfView(of: gameStackView)
        setPlayersCards(in : gameStackView)
        setDealersCards(in : gameStackView)
    }
    
    func makeParticipantLabel(of who: String) -> UILabel{
        let participantLabel = UILabel()
        participantLabel.text = "\(who)"
        participantLabel.textColor = .white
        return participantLabel
    }
    
    func setPlayersCards(in gameStackView : UIStackView) {
        
        var playerNumber = 1
        pokerGame.forEachPlayer(behavior: ){
            player in
            let onePlayerInfoStack = makeParticipantStackView()
            
            onePlayerInfoStack.addArrangedSubview(makeParticipantLabel(of: "Player\(playerNumber)"))
            let cardsStack = makeCardsStackView()
            player.showEachCardInHand(behavior: ){
                (card) in
                let card = UIImageView(image: UIImage(named: card.description))
                setCardImage(of: card)
                cardsStack.addArrangedSubview(card)
            }
            onePlayerInfoStack.addArrangedSubview(cardsStack)
           
            gameStackView.addArrangedSubview(onePlayerInfoStack)
            playerNumber += 1
        }
    }
    
    func setDealersCards(in gameStackView : UIStackView){
        let dealerInfoStack = makeParticipantStackView()
        let dealerLabel = makeParticipantLabel(of: "Dealer")
        dealerInfoStack.addArrangedSubview(dealerLabel)
        let dealerCardStack = makeCardsStackView()
        let dealerCardsStack = addDealerCards(of: dealerCardStack)
        dealerInfoStack.addArrangedSubview(dealerCardsStack)
        gameStackView.addArrangedSubview(dealerInfoStack)
    }
    
    func addDealerCards(of stackView: UIStackView) -> UIStackView {
        let dealerStack = stackView
        pokerGame.showDealerCards(behavior: ){ card in
        let card = UIImageView(image: UIImage(named: card.description))
        setCardImage(of: card)
        dealerStack.addArrangedSubview(card)
        }
        return dealerStack
    }
    
    func setCardImage(of card: UIImageView){
        card.contentMode = .scaleAspectFit
        card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 1.27).isActive = true
    }
    
    func setConstraintOfView(of stackView : UIStackView) {
        stackView.topAnchor.constraint(equalTo: numbersOfPlayersSegmentControl.bottomAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func gameModeSegmentChanged(segmentedControl: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            gameMode = .fiveCardStud
            startPokerGame(gameMode: gameMode, numbersOfPlayers: .two)
        case 1:
            gameMode = .sevenCardStud
            startPokerGame(gameMode: gameMode, numbersOfPlayers: .two)
        default: return
        }
    }
    
    @objc func numbersOfPlayersSegmentChanged(segmentedControl: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            numbersOfPlayers = .two
            startPokerGame(gameMode: gameMode, numbersOfPlayers: numbersOfPlayers)
        case 1:
            numbersOfPlayers = .three
            startPokerGame(gameMode: gameMode, numbersOfPlayers: numbersOfPlayers)
        case 2:
            numbersOfPlayers = .four
            startPokerGame(gameMode: gameMode, numbersOfPlayers: numbersOfPlayers)
        default: return
        }
    }
}





