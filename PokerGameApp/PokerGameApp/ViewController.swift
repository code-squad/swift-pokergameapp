//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let cardImage = UIImage(named:  "card-back")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundImage()
        setupCard()
        
        let players = [Player(), Player(), Player(), Player(playerType: .dealer)]
        let game = PokerGame(rule: .sevenCardStud, players: players)
        game.splitCard()
        players.forEach { player in
            if player.playerType == .dealer {
                print("dealer: \(player.getHandCard)")
            } else {
                print("player: \(player.getHandCard)")
            }
        }
    }

    func setupBackgroundImage() {
        guard let bgImage = UIImage(named: "bg_pattern") else {
            return
        }
        self.view.backgroundColor = .init(patternImage: bgImage)
    }
    
    func setupCard() {
        let cardWidth = view.frame.size.width/7
        let cardHeight = cardWidth * 1.27
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        for _ in 0..<7 {
            stackView.addArrangedSubview(makeCard())
        }
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
    }
    
    func makeCard() -> UIImageView {
        return UIImageView(image: cardImage)
    }
}
