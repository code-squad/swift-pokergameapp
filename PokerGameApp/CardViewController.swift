//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import UIKit

class CardViewController: UIViewController {
    
    static let cardCount : Int = 7 // 카드의 개수
    static let aspectRatio : CGFloat = 1.27 // 카드의 가로 세로 비율
    static let padding : CGFloat = (CGFloat(cardCount)-1) // 카드의 간격의 갯수 (7개의 카드이므로 간격은 6번존재)
    
    let cardBackImage : UIImage = UIImage(named: "cardback.png") ?? UIImage()
    let backgroundImagePattern : UIImage = UIImage(named: "bg_pattern") ?? UIImage()
    
    let segmentControlForCards = UISegmentedControl(items: ["5 Cards", "7 Cards"])
    let segmentControlForPlayers = UISegmentedControl(items: ["2명", "3명", "4명"])
    
    let mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        configureSegmentControl()
        pockerGame()
        configureMainStackView()
    }
    
    func setBackgroundColor(){
        self.view.backgroundColor = UIColor(patternImage: backgroundImagePattern)
    }
    
    func drawCards(players : Players,  dealer : Dealer){
        resetView()
        for (id, player) in players.player.enumerated() {
            addTextLabel(text : "Player\(id+1)")
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
        
        player.cards.cards.forEach{ card in
            let cardImageView = getCardImageView(card: card)
            horizontalStackView.addArrangedSubview(cardImageView)
        }
        mainStackView.addArrangedSubview(horizontalStackView)
    }
    
    func getCardImageView(card : Card) -> UIImageView{
        let imageView = UIImageView()
        let cardname = OutputView.cardToString(card: card)
        imageView.image = UIImage(named: cardname)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    @objc func pockerGame(){
        let cardSqud = InputView.segmentToCardSqud(segmentControlForCards)
        let participant = InputView.segmentToPlayersCount(segmentControlForPlayers)
        let pokergame = PokerGame(participants: participant, cardSqud: cardSqud)
        pokergame.start()
        drawCards(players: pokergame.players, dealer : pokergame.dealer)
    }
    func resetView(){
        mainStackView.subviews.forEach{$0.removeFromSuperview()}
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pockerGame()
        }
    }
}

extension CardViewController {
    
    // MARK: Configuration
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
