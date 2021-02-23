//
//  ViewController.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cardStudSegment: UISegmentedControl!
    @IBOutlet weak var playerCountSegment: UISegmentedControl!
    
    var pokerGame: PokerGame?
    var cardStud: PokerGame.CardStud = .seven
    var playerCount: PokerGame.PlayerCount = .two
   
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackGround()
        startGame()
//        self.becomeFirstResponder()
    }
    
//    override var canBecomeFirstResponder: Bool {
//        get {
//            return true
//        }
//    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            startGame()
        }
    }
  
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // 백그라운드 배경
    func makeBackGround() {
        if let bgImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = .init(patternImage: bgImage)
        }
    }
    
    func startGame() {
        let pokerGame = PokerGame(playerCount: PokerGame.PlayerCount(rawValue: playerCount.rawValue)!, cardStud: PokerGame.CardStud(rawValue: cardStud.rawValue)!)
        self.pokerGame = pokerGame
        pokerGame.makeGamePlayer()
        pokerGame.distributeCard()
        makeVerticalStackView()
    }
    
    // 카드 이미지 뷰
    func makeCardImageView(card: Card) -> UIImageView {
        let cardSuit = card.suit.transformSuit()
        let cardRank = card.rank.transformRank()
        let cardImageView = UIImageView()
        let image = UIImage(named: "\(cardSuit)\(cardRank)")
        cardImageView.image = image
        cardImageView.widthAnchor.constraint(equalTo: cardImageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return cardImageView
    }
    
    
    // 카드 이미지 뷰를 가지고 있는 스택 뷰
    func makePlayerCardStackView(player: Player) -> UIStackView {
        let cards = player.player
        let cardStackView = UIStackView()
        cardStackView.axis = .horizontal
        cardStackView.distribution = .fillEqually
        cardStackView.alignment = .fill
        
        cardStackView.spacing = -10
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        for i in 0..<cardStud.rawValue {
            cardStackView.addArrangedSubview(makeCardImageView(card: cards[i]))
        }
        
        return cardStackView
    }
    func makeDealerCardStackView(dealer: Dealer) -> UIStackView {
        let cards = dealer.dealer
        let cardStackView = UIStackView()
        cardStackView.axis = .horizontal
        cardStackView.distribution = .fillEqually
        cardStackView.alignment = .fill
        
        cardStackView.spacing = -10
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        for i in 0..<cardStud.rawValue {
            cardStackView.addArrangedSubview(makeCardImageView(card: cards[i]))
        }
        return cardStackView
    }
    
    
    // 플레이어 라벨을 가지고 있는 스택 뷰
    func makeLabelStackView(text: String) -> UIStackView {
        let nameStackView = UIStackView()
        nameStackView.axis = .vertical
        nameStackView.alignment = .fill
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabel = UILabel()
        nameLabel.text = text
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameStackView.addArrangedSubview(nameLabel)
        return nameStackView
    }
    
    // 라벨 스택 뷰, 카드 스택 뷰를 가지고 있는 큰 스택 뷰
    func makeVerticalStackView() {
        // 옵셔널 바인딩
        guard let game = pokerGame else { return  }
        let stackView = verticalStackView
        stackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: playerCountSegment.bottomAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
      
        for num in 0..<playerCount.rawValue {
            stackView.addArrangedSubview(makeLabelStackView(text: "Player\(num+1)"))
            stackView.addArrangedSubview(makePlayerCardStackView(player: game.players[num]))
        }
        stackView.addArrangedSubview(makeLabelStackView(text: "Dealer"))
        stackView.addArrangedSubview(makeDealerCardStackView(dealer: game.dealer))
    }
    
    let verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .top
        verticalStackView.spacing = 5
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    @IBAction func changeCardStud(_ sender: Any) {
        switch cardStudSegment.selectedSegmentIndex {
        case 0:
            cardStud = .seven
        case 1:
            cardStud = .five
        default:
            break
        }
        startGame()
    }
    
    @IBAction func changePlayerCount(_ sender: Any) {
        switch playerCountSegment.selectedSegmentIndex {
        case 0:
            playerCount = .two
        case 1:
            playerCount = .three
        case 2:
            playerCount = .four
        default:
            break
        }
        startGame()
    }
}
