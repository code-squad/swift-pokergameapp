//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView!
    var pokerGame: PokerGame?
    var pokerGameParticipant: Participant?
    var pokerGameType: GameType?
    var playersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
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
        self.view.addSubview(playersStackView)
    }
   
    func setBackground() {
        guard let bgImage = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: bgImage)
    }
    
    func generateImage(with cardImage: String) -> UIImageView {
        let width = self.view.bounds.width/8
        let height = self.view.bounds.width/8 * 1.27
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.image = UIImage(named: cardImage)
        return imageView
    }
    
    func makeCardStackView(player: Player) -> UIStackView {
        let stackView = UIStackView()
        self.stackView.axis = .horizontal
        self.stackView.alignment = .fill
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 5
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        player.retrieveCard { (card) in
            let imageView = UIImageView()
            imageView.image = UIImage(named: card.description)
            stackView.addArrangedSubview(imageView)
        }
        return stackView
    }

    
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
        startGame()
    }

}

