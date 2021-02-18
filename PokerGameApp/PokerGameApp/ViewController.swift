//
//  ViewController.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let horizontalStackView : UIStackView  = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let cardBackgroundImage : UIImage = {
        guard let image = UIImage(named: "card-back") else {
            return UIImage()
        }
        return image
    }()
    
    private var cardDeck = CardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:
                                                backgroundImageChange(imageName: "bg_pattern"))
        
        cardDeck.shuffle()
        constrainUI()
        makeCard()
    
        let pokerGame = PockerGame()
        //while pokerGame.countCardDeck() {
        pokerGame.startGame(particpatin: .two, gameType: .five)
        pokerGame.showPlayersCard().forEach { (card) in
            card.hasPlayerCardInfo().values.forEach({ (d) in
                print(d.showCards())
            })
        }
        //pokerGame.resetCard()
        //}
    }
    
    func backgroundImageChange(imageName : String) -> UIImage {
        guard let backgroundimage = UIImage(named: imageName) else {
            return UIImage()
        }
        return backgroundimage
    }
    
    private func constrainUI() {
        self.view.addSubview(horizontalStackView)
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            horizontalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }
    
    private func makeCard()  {
        (0...6).forEach { _ in
            guard let card = cardDeck.removeOne() else { return }
            horizontalStackView.addArrangedSubview(createImageView(card : card))
        }
    }
	
    private func createImageView(card : Card) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:card.description)
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return imageView
    }
}

