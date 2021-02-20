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
    
    var pokerGame: PokerGame?
    var pokerGameRule: PokerGame.Rule = .sevenCardStud
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
    
    func makePlayerStackView(player: Player) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = player.playerType.rawValue
        label.textColor = .white
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(makePlayerHandCard(with: player))
        
        return stackView
    }
    
    func makePlayerHandCard(with player: Player) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -14
        stackView.translatesAutoresizingMaskIntoConstraints = false

        player.retrieveHandCard(completion: { card in
            let cardImageView = makeCard(card: card)
            stackView.addArrangedSubview(cardImageView)
        })
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
    
    func makeAllPlayersHandCard(players: Players) {
        allPlayersHandCardStackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }

        players.retrievePlayer(completion: { player in
            let stackView = makePlayerStackView(player: player)
            allPlayersHandCardStackView.addArrangedSubview(stackView)
        })
    }
    
    func pokerGameStart() {
        let game = PokerGame(rule: pokerGameRule, count: numberOfPlayers.rawValue)
        do {
            try game.play()
        } catch {
            print("카드가 부족해서 게임을 종료합니다.")
        }
        makeAllPlayersHandCard(players: game.players)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pokerGameStart()
        }
    }
    
    // MARK: - IBAction
    @IBAction func didChangeGameRule(_ sender: Any) {
        switch gameRuleSegmentedControl.selectedSegmentIndex {
        case 0:
            pokerGameRule = .sevenCardStud
        case 1:
            pokerGameRule = .fiveCardStud
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

        pokerGameStart()
    }
}
