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
    
    let cardImage = UIImage(named:  "s7")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundImage()
        setupCard()
    }

    func setupBackgroundImage() {
        guard let bgImage = UIImage(named: "bg_pattern") else {
            return
        }
        self.view.backgroundColor = .init(patternImage: bgImage)
    }
    
    func setupCard() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -14
        stackView.translatesAutoresizingMaskIntoConstraints = false

        for _ in 0..<gameRule.rawValue {
            let cardImageView = makeCard()
            cardImageView.translatesAutoresizingMaskIntoConstraints = false
            cardImageView.widthAnchor.constraint(equalTo: cardImageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
            stackView.addArrangedSubview(cardImageView)
        }
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: numberOfPlayersSegmentedControl.bottomAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
    
    func makeCard() -> UIImageView {
        return UIImageView(image: cardImage)
    }
    
    func makePlayers() -> Players {
        var players: [Player] = []
        (1...numberOfPlayers.rawValue).forEach { _ in
            players.append(Player())
        }
        return Players(players: players)
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
        print(players.description)
    }
}
