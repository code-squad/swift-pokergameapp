//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import UIKit

class CardViewController: UIViewController {
    
    let cardBackImage : UIImage = UIImage(named: "cardback.png") ?? UIImage()
    let backgroundImagePattern : UIImage = UIImage(named: "bg_pattern") ?? UIImage()
    
    let segmentControlForCards = UISegmentedControl(items: ["5 Cards", "7 Cards"])
    let segmentControlForPlayers = UISegmentedControl(items: ["2명", "3명", "4명"])
    
    let mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        configureSegmentControl()
        configureMainStackView()
    }
    
    func setBackgroundColor(){
        self.view.backgroundColor = UIColor(patternImage: backgroundImagePattern)
    }
    
    @objc func pockerGame(){
        let cardSqud = segmentToCardSqud(segmentControlForCards)
        let participant = segmentToPlayersCount(segmentControlForPlayers)
        let pokergame = PokerGame(participants: participant, cardSqud: cardSqud)
        pokergame.start()
        drawCards(players: pokergame.players, dealer : pokergame.dealer)
    }
    
    func resetView(){
        mainStackView.subviews.forEach{$0.removeFromSuperview()}
    }
}

// MARK: drawing cards
extension CardViewController {
    
    func drawCards(players : Players,  dealer : Dealer){
        resetView()
        players.eachPlayers{ id, player in
            addTextLabel(text : "Player\(id)")
            addCardsStackView(from: player)
        }
        addTextLabel(text : "Dealer")
        addCardsStackView(from: dealer)
    }
    
    func addTextLabel(text : String){
        let textLebel = UILabel()
        textLebel.text = text
        textLebel.textColor = .white
        textLebel.font = UIFont.boldSystemFont(ofSize: 15)
        textLebel.textAlignment = .left
        mainStackView.addArrangedSubview(textLebel)
    }
    
    func addCardsStackView(from player : Player){
        let horizontalStackView = UIStackView()
        configureHorizontalStackView(with: horizontalStackView)

        player.eachCards{ card in
            let cardImageView = getCardImageView(card: card)
            horizontalStackView.addArrangedSubview(cardImageView)
        }
        mainStackView.addArrangedSubview(horizontalStackView)
    }
    
    func getCardImageView(card : Card) -> UIImageView{
        let imageView = UIImageView()
        let cardname = cardToString(card: card)
        imageView.image = UIImage(named: cardname)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}

// MARK: methods to change value type
extension CardViewController {
    
    func cardToString(card : Card) -> String {
        var cardname : String = ""
        
        switch card.suit {
        case .clubs : cardname += "c"
        case .dimonds : cardname += "d"
        case .hearts : cardname += "h"
        case .spades : cardname += "s"
        }
        cardname += card.rank.description
        return cardname
    }
    func segmentToCardSqud(_ segmentControl : UISegmentedControl) -> PlayOption.CardStud {
        let value = segmentControl.selectedSegmentIndex
        switch value {
        case 0 : return PlayOption.CardStud.five
        case 1 : return PlayOption.CardStud.seven
        default:
            return PlayOption.CardStud.none
        }
    }
    func segmentToPlayersCount(_ segmentControl : UISegmentedControl) -> PlayOption.PlayersCount {
        let value = segmentControl.selectedSegmentIndex
        switch value {
        case 0 : return PlayOption.PlayersCount.two
        case 1 : return PlayOption.PlayersCount.three
        case 2 : return PlayOption.PlayersCount.four
        default : return PlayOption.PlayersCount.none
        }
    }
}

// MARK: Motion Event Handling
extension CardViewController {
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pockerGame()
        }
    }
}

// MARK: Configuration
extension CardViewController {
    
    func configureMainStackView(){
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        
        setMainStackViewConstraints()
    }
    
    func configureHorizontalStackView(with stackView : UIStackView){
        stackView.axis = .horizontal
        stackView.spacing = -8
        stackView.distribution = .fillEqually
    }
    
    func configureSegmentControl(){
        view.addSubview(segmentControlForCards)
        view.addSubview(segmentControlForPlayers)
        
        segmentControlForCards.addTarget(self, action: #selector(pockerGame), for: .valueChanged)
        segmentControlForPlayers.addTarget(self, action: #selector(pockerGame), for: .valueChanged)
        setSegmentControlForCardsConstraints()
        setSegmentControlForPlayersConstraints()
    }
}

// MARK: Constraints
extension CardViewController {
    // MARK: Segment Control Constraints
    // Cards segmentControl : 가장 위에 그려짐
    func setSegmentControlForCardsConstraints(){
        segmentControlForCards.selectedSegmentIndex = 0
        segmentControlForCards.translatesAutoresizingMaskIntoConstraints = false
        segmentControlForCards.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        segmentControlForCards.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        segmentControlForCards.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    // Player SegmentControl : Card segmentControl 밑에 그려짐
    func setSegmentControlForPlayersConstraints(){
        segmentControlForPlayers.selectedSegmentIndex = 0
        segmentControlForPlayers.translatesAutoresizingMaskIntoConstraints = false
        segmentControlForPlayers.topAnchor.constraint(equalTo: segmentControlForCards.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        segmentControlForPlayers.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        segmentControlForPlayers.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    
    // MARK: StackView Constraints
    // StackView : Player Segment Control 밑에 그려짐
    func setMainStackViewConstraints(){
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true // 수정할 것
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
}
