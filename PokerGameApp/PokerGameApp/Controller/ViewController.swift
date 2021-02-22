//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView!
    let cardBackImage = UIImage(named: "card-back")
    var cards = CardDeck(cards: [])
    var pokerGame: PokerGame?
    var pokerGameParticipant: Participant?
    var pokerGameType: GameType?
    var gameTypeSegment: UISegmentedControl {
        let sc: UISegmentedControl = UISegmentedControl(items: ["5 Cards", "7 Cards"])
        sc.center = CGPoint(x: self.view.frame.width/2, y: 80)
        sc.addTarget(self, action: #selector(gameTypeChanged(sender:)), for: .valueChanged)
        return sc
    }
    var participantSegment: UISegmentedControl {
        let sc: UISegmentedControl = UISegmentedControl(items: ["2명", "3명", "4명"])
        sc.center = CGPoint(x: self.view.frame.width/2, y: 120)
        sc.addTarget(self, action: #selector(participantChanged(sender:)), for: .valueChanged)
        return sc
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        self.view.addSubview(gameTypeSegment)
        self.view.addSubview(participantSegment)
    }
   
    func setBackground() {
        guard let bgImage = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: bgImage)
    }
    
//    func setStackView() {
//        self.stackView = UIStackView()
//        self.stackView.axis = .horizontal
//        self.stackView.alignment = .fill
//        self.stackView.distribution = .equalSpacing
//        self.stackView.spacing = 5
//        self.stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        for _ in 0...6 {
//            self.stackView.addArrangedSubview(generateImage())
//        }
//
//        self.view.addSubview(stackView)
//        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//    }
    
//    func generateImage() -> UIImageView {
//        let width = self.view.bounds.width/8
//        let height = self.view.bounds.width/8 * 1.27
//        let imageView = UIImageView()
//        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
//        imageView.image = cardBackImage
//        return imageView
//    }

//    func testPoker() {
//        let pokergame = PokerGame(players: Players(participant: .four), dealer: Dealer(gameType: .seven))
//        pokergame.startGame()
//        pokergame.printParticipantCards()
//    }
    @objc func gameTypeChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pokerGameType = .five
        case 1:
            pokerGameType = .seven
        default:
            return
        }
    }
    @objc func participantChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pokerGameParticipant = .two
        case 1:
            pokerGameParticipant = .three
        case 2:
            pokerGameParticipant = .four
        default:
            return
        }
    }

}

