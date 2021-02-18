//
//  ViewController.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let pockerGameStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let playerStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let playerName : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cardStackView : UIStackView  = {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:
                                                backgroundImageChange(imageName: "bg_pattern"))
        constrainUI()
        makeCard()
    
        let pokerGame = PockerGame()
        //while pokerGame.countCardDeck() {
        pokerGame.startGame(particpatin: .two, gameType: .five)
        pokerGame.showPlayersCard().forEach { (card) in
//            card.hasPlayerCardInfo().forEach({ (d) in
//                print(d.key, separator: "", terminator: " ")
//                print(d.value.showCards(), separator: "", terminator: "")
//            })
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
        self.view.addSubview(cardStackView)
        NSLayoutConstraint.activate([
            cardStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            cardStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            cardStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }
    
    private func makeCard()  {
        (0...6).forEach { _ in
            cardStackView.addArrangedSubview(createImageView())
        }
    }
	
    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = cardBackgroundImage
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return imageView
    }
}

