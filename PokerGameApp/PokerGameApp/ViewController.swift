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
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            startGame()
        }
    }
  
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func makeBackGround() {
        if let bgImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = .init(patternImage: bgImage)
        }
    }
    
    func startGame() {
        pokerGame = PokerGame(playerCount: playerCount, cardStud: cardStud)
        guard let game = pokerGame else {
            return
        }
        game.makeGamePlayer()
        game.distributeCard()
        makeVerticalStackView()
    }
    
    func makeCardImageView(card: Card) -> UIImageView {
        let cardSuit = card.suit.transformSuit()
        let cardRank = card.rank.transformRank()
        let cardImageView = UIImageView()
        let image = UIImage(named: "\(cardSuit)\(cardRank)")
        cardImageView.image = image
        cardImageView.widthAnchor.constraint(equalTo: cardImageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return cardImageView
    }
    
    func makePlayerCardStackView(player: Player) -> UIStackView {
        let cardStackView = UIStackView()
        cardStackView.axis = .horizontal
        cardStackView.distribution = .fillEqually
        cardStackView.alignment = .fill
        
        cardStackView.spacing = -10
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        player.retrieveCard(completion: {card in
            let cardImageView = makeCardImageView(card: card)
            cardStackView.addArrangedSubview(cardImageView)
        })
        return cardStackView
    }
    
    func makeDealerCardStackView(dealer: Dealer) -> UIStackView {
        let cardStackView = UIStackView()
        cardStackView.axis = .horizontal
        cardStackView.distribution = .fillEqually
        cardStackView.alignment = .fill
        
        cardStackView.spacing = -10
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        dealer.retrieveCard(completion: {card in
            let cardImageView = makeCardImageView(card: card)
            cardStackView.addArrangedSubview(cardImageView)
        })
        return cardStackView
    }
    
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
    
    func makeVerticalStackView() {
        guard let game = pokerGame else { return  }
        let verticalStackView = stackView
        verticalStackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        view.addSubview(verticalStackView)
        verticalStackView.topAnchor.constraint(equalTo: playerCountSegment.bottomAnchor, constant: 20).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
      
        game.retrievePlayer(completion: { player in
            let stackView = makePlayerCardStackView(player: player)
            verticalStackView.addArrangedSubview(makeLabelStackView(text: player.description))
            verticalStackView.addArrangedSubview(stackView)
        })
        
        game.retrieveDealer(completion: { dealer in
            let stackView = makeDealerCardStackView(dealer: dealer)
            verticalStackView.addArrangedSubview(makeLabelStackView(text: dealer.description))
            verticalStackView.addArrangedSubview(stackView)
        })

    }
    
    let stackView: UIStackView = {
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
