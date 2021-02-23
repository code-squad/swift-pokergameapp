//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    let cardBackImage: UIImage = {
        UIImage(named: "card-back") ?? UIImage()
    }()
    let card = Card(shape: .diamond, number: .king)
    let card2 = Card(shape: .diamond, number: .seven)
    var testCardGame = TestCardGame()
    var pokerGame = PokerGame(playerNumber: .one, gameType: .five)
    var mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokerGame.startGame()
        initialize()
        print(card)
        print(card2)
        //testCardGame.testGame()
    }
    
    private func initialize() {
        drawBackground()
        makeSegmentedControl()
        initMainStackView()
    }
    
    private func makeSegmentedControl() {
        self.view.addSubview(gameTypeSegmentControl)
        self.view.addSubview(playerNumberSegmentControl)
        
        gameTypeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        gameTypeSegmentControl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        gameTypeSegmentControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        gameTypeSegmentControl.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        playerNumberSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        playerNumberSegmentControl.topAnchor.constraint(equalTo: gameTypeSegmentControl.bottomAnchor, constant: 10).isActive = true
        playerNumberSegmentControl.widthAnchor.constraint(equalTo: gameTypeSegmentControl.widthAnchor).isActive = true
        playerNumberSegmentControl.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
    }
    
    private func writeParticipantNameLabel(name: String) -> UILabel {
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .white
        return nameLabel
    }
    
    private func initMainStackView() {
        setPlayerStackView()

        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 10
        self.view.addSubview(mainStackView)
        
        let margin = view.layoutMarginsGuide
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 5).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20).isActive = true
        mainStackView.topAnchor.constraint(equalTo: playerNumberSegmentControl.bottomAnchor, constant: 10).isActive = true
    }
    
    private func drawBackground() {
        if let image = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    private let playerNumberSegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: PokerGame.PlayerNumber.allCases.map{"\($0.value)명"})
        configSegmentedControl(segment: segment)
        segment.addTarget(self, action: #selector(changePlayerNumber), for: .valueChanged)
        return segment
    }()

    private let gameTypeSegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: PokerGame.GameType.allCases.map{ "\($0.value) Card" })
        configSegmentedControl(segment: segment)
        segment.addTarget(self, action: #selector(changeGameType), for: .valueChanged)
        return segment
    }()
    
    var newPlayerNumber: PokerGame.PlayerNumber = .one
    var newGameType: PokerGame.GameType = .five
    
    @objc func changeGameType(_ sender : UISegmentedControl) {
        newGameType = PokerGame.GameType.allCases[sender.selectedSegmentIndex]
        pokerGame = PokerGame(playerNumber: newPlayerNumber, gameType: newGameType)
        pokerGame.resetGame()
        removeMainStackViewSubViews()
        initMainStackView()
    }
 
    @objc func changePlayerNumber(_ sender : UISegmentedControl) {
        newPlayerNumber = PokerGame.PlayerNumber.allCases[sender.selectedSegmentIndex]
        pokerGame = PokerGame(playerNumber: newPlayerNumber, gameType: newGameType)
        pokerGame.resetGame()
        removeMainStackViewSubViews()
        initMainStackView()
    }
    
    private func removeMainStackViewSubViews() {
        mainStackView.subviews.forEach { view in
               view.removeFromSuperview()
           }
       }
    
    static private func configSegmentedControl(segment: UISegmentedControl) {
        segment.tintColor = .white
        segment.selectedSegmentIndex = 0
        segment.layer.borderWidth = 1
        segment.layer.borderColor = UIColor.white.cgColor

        let normalFontColor: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white ]
        let selectedFontColor: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black ]
        
        segment.setTitleTextAttributes(normalFontColor, for: .normal)
        segment.setTitleTextAttributes(selectedFontColor, for: .selected)
    }
    
    private func createCardImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }
    
    private func makeCard(cards : [Card]) -> UIStackView {
          let cardStackView = UIStackView()
          cardStackView.axis = .horizontal
          cardStackView.distribution = .fillEqually
          cardStackView.alignment = .fill
          cardStackView.spacing = -10
          cardStackView.translatesAutoresizingMaskIntoConstraints = false
          
          cards.forEach { card in
            cardStackView.addArrangedSubview(createCardImageView(image: UIImage(named: "\(card.shape.imageFileName)\(card.number)") ?? UIImage()))
          }
          return cardStackView
      }
    
    private func setPlayerStackView() {
        pokerGame.showPlayersCard { (Players) in
            let playerStackView = UIStackView()
            var playerNumber = 0
            
            playerStackView.axis = .vertical
            playerStackView.distribution = .fill
            playerStackView.alignment = .fill
            playerStackView.spacing = 10
            mainStackView.addArrangedSubview(playerStackView)
           
            Players.repeatForEachPlayer{
                playerNumber += 1
                playerStackView.addArrangedSubview(writeParticipantNameLabel(name: "참가자\(playerNumber)"))
                playerStackView.addArrangedSubview(makeCard(cards: $0.showCards()))
            }
        }
        
        pokerGame.showDealerCard { (Dealer) in
            let playerStackView = UIStackView()
            playerStackView.axis = .vertical
            playerStackView.distribution = .fill
            playerStackView.alignment = .fill
            playerStackView.spacing = 10
            mainStackView.addArrangedSubview(playerStackView)
            
            playerStackView.addArrangedSubview(writeParticipantNameLabel(name: "딜러"))
            playerStackView.addArrangedSubview(makeCard(cards: Dealer.showCards()))
        }
    }

    private func createCardStackView() -> UIStackView {
        let stackView = UIStackView()
        let numberOfCard = 7
        let intervalBetweenCards: CGFloat = -5
        
        for _ in 0..<numberOfCard {
            stackView.addArrangedSubview(createCardImageView(image: UIImage(named: "dK") ?? UIImage()))
        }
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = intervalBetweenCards

        return stackView
    }
    
    //상태바 글씨를 흰색으로 변경
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                pokerGame.resetGame()
                removeMainStackViewSubViews()
                initMainStackView()
            }
    }
}

