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
    
    let cardImage = UIImage(named:  "card-back")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundImage()
        //setupCard()
        
        let players = Players(players: [Player(), Player(), Player(), Player(playerType: .dealer)])
        let game = PokerGame(players: players)
        game.play()
        print(players.description)
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
    
    // MARK: - IBAction
    @IBAction func didChangeGameRule(_ sender: Any) {
        switch gameRuleSegmentedControl.selectedSegmentIndex {
        case 0:
            print("7 Cards")
        case 1:
            print("5 Cards")
        default:
            break
        }
    }
    
    @IBAction func didChangeNumberOfPlayers(_ sender: Any) {
        switch gameRuleSegmentedControl.selectedSegmentIndex {
        case 0:
            print("2 Players")
        case 1:
            print("3 Players")
        case 2:
            print("4 Players")
        default:
            break
        }
    }
}
