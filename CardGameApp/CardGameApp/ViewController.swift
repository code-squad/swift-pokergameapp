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
    private var winnerMedal = UIView()
    private var winnerPosition : Int = -1
    
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
        setParticipantsCards(in : gameStackView)
    }
    
    func makeParticipantLabel(of who: String) -> UILabel{
        let participantLabel = UILabel()
        participantLabel.text = "\(who)"
        participantLabel.textColor = .white
        return participantLabel
    }
    
    func setParticipantsCards(in gameStackView : UIStackView) {
        pokerGame.forEachParticipant(behavior: ){
            participant in
            
            // 참가자의 라벨과 카드들을 담는 스택
            let oneParticipantInfoStack = ParticipantStackView()
            oneParticipantInfoStack.addArrangedSubview(makeParticipantLabel(of: participant.describeSelf()))
            
            let cardsStack = CardsStackView()
            participant.showEachCardInHand(behavior: ){
                (card) in
                let card = UIImageView(image: UIImage(named: card.description))
                setCardImage(of: card)
                cardsStack.addArrangedSubview(card)
            }
            oneParticipantInfoStack.addArrangedSubview(cardsStack)
            
            // 참가자 정보(라벨,카드)와 숨겨진 메달 이미지를 담는 스택
            let participantSectionStack = ParticipantSectionStack()
            participantSectionStack.addArrangedSubview(oneParticipantInfoStack)
            participantSectionStack.addArrangedSubview(makeMedalImage())
            gameStackView.addArrangedSubview(participantSectionStack)
        }
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
        let winnerIndex = pokerGame.findWinner()
        self.winnerPosition = winnerIndex
        addMedalImage(to: winnerPosition)
    }
    
    func updateCardStackConstraint(){
        for participantSection in gameStackView.arrangedSubviews{
            let oneParticipantInfoStack = participantSection.subviews[0]
            let medal = participantSection.subviews[1]
            let cardsStack = oneParticipantInfoStack.subviews[1]
            cardsStack.trailingAnchor.constraint(equalTo: winnerMedal.leadingAnchor).isActive = true
        }
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
        default:
            return
        }
    }
    
    func addMedalImage(to winnerPosition: Int){
        let hiddenMedalImage = gameStackView.arrangedSubviews[winnerPosition].subviews[1]
        self.winnerMedal = hiddenMedalImage
        updateCardStackConstraint()
        hiddenMedalImage.isHidden = false
    }
    
    func makeMedalImage() -> UIImageView{
        var medalImage = UIImageView(image: UIImage(named: "winnerMedal"))
        medalImage.translatesAutoresizingMaskIntoConstraints = false
        medalImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        medalImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        medalImage.isHidden = true
        return medalImage
    }
}
