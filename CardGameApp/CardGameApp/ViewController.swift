//
//  ViewController.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    private var pokerGame = PokerGame(numbersOfPlayers: .four, gameMode: .fiveCardStud)
    private var gameMode = GameMode.fiveCardStud
    private var numbersOfPlayers = NumbersOfPlayers.four
        private var gameStackView = GameStackView()
    private var gameModeSegmentedControl = GameModeSegmentControl()
    private var numbersOfPlayersSegmentedControl = NumbersOfPlayersSegmentControl()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:  #imageLiteral(resourceName: "bg_pattern"))
        self.view.addSubview(gameModeSegmentedControl)
        gameModeSegmentedControl.setSegmetedControl(in: self.view, offset: 15)
        
        self.view.addSubview(numbersOfPlayersSegmentedControl)
        numbersOfPlayersSegmentedControl.setSegmetedControl(in: self.view, offset: 9)
        gameModeSegmentedControl.delegate = self
        numbersOfPlayersSegmentedControl.delegate = self
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
        stackView.topAnchor.constraint(equalTo: numbersOfPlayersSegmentedControl.bottomAnchor, constant: 10).isActive = true
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
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pokerGame.shuffleWholeCardDeck()
            startPokerGame(gameMode: gameMode, numbersOfPlayers: numbersOfPlayers)
        }
    }
    
}
extension ViewController: SegmentedControlProtocol{
    func segmentControlDidChange() {
        gameModeSegmentChanged(segmentedControl: gameModeSegmentedControl)
        numbersOfPlayersSegmentChanged(segmentedControl: numbersOfPlayersSegmentedControl)
        
    }
}
