//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
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
    var gameTypeSegment: UISegmentedControl = {
        let sc: UISegmentedControl = UISegmentedControl(items: ["5 Cards", "7 Cards"])
        sc.addTarget(self, action: #selector(gameTypeChanged(sender:)), for: .valueChanged)
        return sc
    }()
    var participantSegment: UISegmentedControl = {
        let sc: UISegmentedControl = UISegmentedControl(items: ["2명", "3명", "4명"])
        sc.addTarget(self, action: #selector(participantChanged(sender:)), for: .valueChanged)
        return sc
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        self.view.addSubview(gameTypeSegment)
        self.view.addSubview(participantSegment)
        self.view.addSubview(playersStackView)
        setSegmentControlConstraints()
        setPlayersStackViewConstraints()
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
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = -14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        player.retrieveCard { (card) in
            let imageView = generateImage(with: card.description)
            stackView.addArrangedSubview(imageView)
        }
        return stackView
    }
    
    func makePlayerStackView(player: Player) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.textColor = .white
        label.text = player.name
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(makeCardStackView(player: player))
        
        return stackView
    }
    
    func makePlayersStackView(players: Players) {
        playersStackView.subviews.forEach { (subView) in
            subView.removeFromSuperview()
        }
        
        players.retrievePlayer { (player) in
            let stackView = makePlayerStackView(player: player)
            playersStackView.addArrangedSubview(stackView)
        }
    }
    
    func startGame() {
        guard let gameType = pokerGameType else {return}
        guard let participant = pokerGameParticipant else {return}
        pokerGame = PokerGame(players: Players(participant: participant), dealer: Dealer(gameType: gameType))
        pokerGame?.startGame()
        makePlayersStackView(players: pokerGame!.players)
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

extension ViewController {
    func setSegmentControlConstraints() {
        gameTypeSegment.translatesAutoresizingMaskIntoConstraints = false
        participantSegment.translatesAutoresizingMaskIntoConstraints = false
        gameTypeSegment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        gameTypeSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        participantSegment.topAnchor.constraint(equalTo: gameTypeSegment.bottomAnchor, constant: 10).isActive = true
        participantSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setPlayersStackViewConstraints() {
        playersStackView.topAnchor.constraint(equalTo: participantSegment.bottomAnchor, constant: 10).isActive = true
        playersStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        playersStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
}
