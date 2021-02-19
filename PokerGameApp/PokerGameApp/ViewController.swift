//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameRuleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPlayersSegmentedControl: UISegmentedControl!
    
    var game: PokerGame?
    var gameRule: PokerGame.Rule = .sevenCardStud
    var numberOfPlayers: PokerGame.NumberOfPlayers = .two
    
    var allPlayersHandCardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundImage()
        view.addSubview(allPlayersHandCardStackView)
        allPlayersHandCardStackView.topAnchor.constraint(equalTo: numberOfPlayersSegmentedControl.bottomAnchor,
                                                         constant: 20).isActive = true
        allPlayersHandCardStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                             constant: 20).isActive = true
        allPlayersHandCardStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                              constant: -20).isActive = true
    }

    func setupBackgroundImage() {
        guard let bgImage = UIImage(named: "bg_pattern") else {
            return
        }
        self.view.backgroundColor = .init(patternImage: bgImage)
    }
    
    func makePlayerHandCard(with player: Player) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -14
        stackView.translatesAutoresizingMaskIntoConstraints = false

        (player.handCard.cards).forEach { card in
            let cardImageView = makeCard(card: card)
            stackView.addArrangedSubview(cardImageView)
        }
        return stackView
    }
    
    func makeCard(card: Card) -> UIImageView {
        // TODO: 카드 이미지뷰는 매번 새로 만들지 않도록 개선
        let cardShape = card.shape.getShortCut()
        let cardNumber = card.number.getShortCut()
        let cardImage = UIImage(named: "\(cardShape)\(cardNumber)")
        let cardImageView = UIImageView(image: cardImage)
        
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.widthAnchor.constraint(equalTo: cardImageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return cardImageView
    }
    
    func makePlayers() -> Players {
        var players: [Player] = []
        (1...numberOfPlayers.rawValue).forEach { _ in
            players.append(Player())
        }
        return Players(players: players)
    }
    
    func makeAllPlayersHandCard(players: Players) {
        allPlayersHandCardStackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }

        players.players.forEach { player in
            let label = UILabel()
            label.text = "Player"
            label.textColor = .white
            label.heightAnchor.constraint(equalToConstant: 20).isActive = true
            let playerCardStackView = makePlayerHandCard(with: player)
            
            allPlayersHandCardStackView.addArrangedSubview(label)
            allPlayersHandCardStackView.addArrangedSubview(playerCardStackView)
        }
    }
    
    // MARK: - IBAction
    @IBAction func didChangeGameRule(_ sender: Any) {
        switch gameRuleSegmentedControl.selectedSegmentIndex {
        case 0:
            gameRule = .sevenCardStud
        case 1:
            gameRule = .fiveCardStud
        default:
            break
        }
    }
    
    @IBAction func didChangeNumberOfPlayers(_ sender: Any) {
        switch numberOfPlayersSegmentedControl.selectedSegmentIndex {
        case 0:
            numberOfPlayers = .two
        case 1:
            numberOfPlayers = .three
        case 2:
            numberOfPlayers = .four
        default:
            break
        }

        let players = makePlayers()
        let game = PokerGame(rule: gameRule, players: players)
        game.play()
        makeAllPlayersHandCard(players: players)
        print(players.description)
    }
}
