//
//  ViewController.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    private let pockerGameStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let segmentStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let gameTypeSegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: ["7card","5card"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let particpatinSegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: ["2명","3명","4명"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let pokerGame = PockerGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundViewImage()
        setSegmentStackView()
        setPockerGameStackView()
        //while pokerGame.countCardDeck()
        pokerGame.startGame(particpatin: .four, gameType: .seven)
        playerStackUI()
        //pokerGame.resetCard()
        //}
    }
    
    private func setBackgroundViewImage() {
        let backgroundimage = UIImage(named: "bg_pattern") ?? UIImage()
        self.view.backgroundColor = UIColor(patternImage: backgroundimage)
    }
    
    private func setSegmentStackView() {
        self.view.addSubview(segmentStackView)
        NSLayoutConstraint.activate([
            segmentStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 10),
            segmentStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        segmentStackView.addArrangedSubview(gameTypeSegmentControl)
        segmentStackView.addArrangedSubview(particpatinSegmentControl)
    }
    
    private func setPockerGameStackView() {
        self.view.addSubview(pockerGameStackView)
        NSLayoutConstraint.activate([
            pockerGameStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            pockerGameStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            pockerGameStackView.topAnchor.constraint(equalTo: segmentStackView.bottomAnchor, constant: 20)
        ])
    }
    
    private func playerStackUI() {
        pokerGame.showPlayersCard().forEach { (card) in
            let playerStackView = UIStackView()
            playerStackView.axis = .vertical
            playerStackView.distribution = .fill
            playerStackView.alignment = .fill
                
            pockerGameStackView.addArrangedSubview(playerStackView)
            
            card.hasPlayerCardInfo().forEach {
                playerStackView.addArrangedSubview(makePlayerNameLabel(name: $0.key))
                playerStackView.addArrangedSubview(makeCard(cards: $0.value.showCards()))
            }
        }
    }
    
    private func makePlayerNameLabel(name : String) -> UILabel {
        let playerName = UILabel()
        playerName.textColor = .white
        playerName.text = name
        playerName.font = .boldSystemFont(ofSize: 20)
        playerName.translatesAutoresizingMaskIntoConstraints = false
        return playerName
    }
    
    private func makeCard(cards : [Card]) -> UIStackView {
        let cardStackView = UIStackView()
        cardStackView.axis = .horizontal
        cardStackView.distribution = .fillEqually
        cardStackView.alignment = .fill
        cardStackView.spacing = -10
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cards.forEach { card in
            cardStackView.addArrangedSubview(createImageView(card : card))
        }
        return cardStackView
    }
	
    private func createImageView(card : Card) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: card.description)
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return imageView
    }
}

