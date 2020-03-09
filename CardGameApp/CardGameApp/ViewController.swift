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
    private var segmentedControl = SegmentedControl()
    private var gameStackView = GameStackView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:  #imageLiteral(resourceName: "bg_pattern"))
        self.view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        segmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        segmentedControl.delegate = self
    }
    // MARK: - Method
    func startPokerGame(gameMode : GameMode, numbersOfPlayers : NumbersOfPlayers){
         gameStackView.subviews.forEach{$0.removeFromSuperview()}
         pokerGame = PokerGame.init(numbersOfPlayers: numbersOfPlayers, gameMode: gameMode)
         pokerGame.start()
         pokerGame.shuffleWholeCardDeck()
         self.view.addSubview(gameStackView)
         gameStackView.setConstraintOfView(related: self.view, related: segmentedControl)
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
            let onePlayerInfoStack = ParticipantStackView()
            
            onePlayerInfoStack.addArrangedSubview(makeParticipantLabel(of: "Player\(playerNumber)"))
            let cardsStack = CardsStackView()
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
        let dealerInfoStack = ParticipantStackView()
        let dealerLabel = makeParticipantLabel(of: "Dealer")
        dealerInfoStack.addArrangedSubview(dealerLabel)
        let dealerCardStack = CardsStackView()
        let dealerCardsStack = addDealerCards(of: dealerCardStack)
        dealerInfoStack.addArrangedSubview(dealerCardsStack)
        gameStackView.addArrangedSubview(dealerInfoStack)
    }

    
    func addDealerCards(of dealerCardStack: UIStackView) -> UIStackView {
        let dealerStack = dealerCardStack
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
        
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pokerGame.shuffleWholeCardDeck()
            startPokerGame(gameMode: gameMode, numbersOfPlayers: numbersOfPlayers)
        }
    }
    
}
extension ViewController: SegmentedControlProtocol{
    func segmentControlDidChange(to mode: (Int,Int)) {
        var gameMode = mode.0
        var numbersOfPlayers = mode.1
        
        gameModeSegmentChanged(selectedSegmentIndex: gameMode)
        numbersOfPlayersSegmentChanged(selectedSegmentIndex: numbersOfPlayers)
        
        // 승자 찾기
        let winnerDiscriminator = WinnerDiscriminator(in: pokerGame)
        winnerDiscriminator.findWinner()
    }
    
    func gameModeSegmentChanged(selectedSegmentIndex: Int){
        switch selectedSegmentIndex {
        case 0:
            gameMode = .fiveCardStud
            startPokerGame(gameMode: gameMode, numbersOfPlayers: .two)
        case 1:
            gameMode = .sevenCardStud
            startPokerGame(gameMode: gameMode, numbersOfPlayers: .two)
        default: return
        }
    }
    
    func numbersOfPlayersSegmentChanged(selectedSegmentIndex: Int){
        switch selectedSegmentIndex {
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
