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
    
    var cardStud: PokerGame.CardStud = .five
    var playerCount: PokerGame.PlayerCount = .one
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackGround()
        makeStackView()
        
        let pokerGame = PokerGame(playerCount: .three, cardStud: .five)
        pokerGame.makeGamePlayer()
        pokerGame.distributeCard()
        print(pokerGame)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func makeBackGround() {
        if let bgImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = .init(patternImage: bgImage)
        }
    }
    
    func makeCardImageView() -> UIImageView {
        let cardImageView = UIImageView()
        let image = UIImage(named: "card-back")
        cardImageView.image = image
        cardImageView.heightAnchor.constraint(equalTo: cardImageView.widthAnchor, multiplier: 1.27).isActive = true
        return cardImageView
    }
    
    func makeStackView() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        for _ in 0..<7 {
            stackView.addArrangedSubview(makeCardImageView())
        }
    }
    
    @IBAction func changeCardStud(_ sender: Any) {
        switch cardStudSegment.selectedSegmentIndex {
        case 0:
            cardStud = .seven
        case 1:
            cardStud = .five
        default:
            break
        }
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
    }
    
}
