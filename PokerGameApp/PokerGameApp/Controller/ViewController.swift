//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    var cardDeck = CardDeck()
    var mockGame = PokerGame(withPlayersOf: .four, stud: .fiveCardStud)
    
    let cardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundPatternImage: UIImage = UIImage(named: "bg_pattern") ?? UIImage()
        let cardBacksideImage: UIImage = UIImage(named: "card-back") ?? UIImage()
        
        self.view.backgroundColor = UIColor(patternImage: backgroundPatternImage)
        self.view.addSubview(cardStackView)
        configureCardStackView(cardStackView: cardStackView)
        addSubviewToCardStackView(numberOfCards: 7, image: cardBacksideImage)
        
        mockGame.gamePlay()
    }
    
    func makeCardImageView(with newImage: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = newImage
        return imageView
    }
    
    func configureCardStackView(cardStackView: UIStackView) {
        cardStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/10).isActive = true
        cardStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
    }
    
    func addSubviewToCardStackView(numberOfCards: Int, image: UIImage) {
        for _ in 0..<numberOfCards {
            let newCardImageView = makeCardImageView(with: image)
            cardStackView.addArrangedSubview(newCardImageView)
            newCardImageView.widthAnchor.constraint(equalTo: cardStackView.heightAnchor, multiplier: 1/1.27).isActive = true
        }
    }
    
    func testScenario(command: String) {
            switch command {
            case "카드초기화": print("카드 전체를 초기화했습니다.");print("총\(cardDeck.count())장의 카드가 있습니다.")
            case "카드섞기": cardDeck.shuffle(); print("전체 \(cardDeck.count())장의 카드를 섞었습니다.")
            case "카드하나뽑기": print("\(cardDeck.removeOne()?.description ?? "뽑을 카드가 없습니다.")\n총 \(cardDeck.count())장의 카드가 남았습니다.")
            default: print("sdf")
        }
    }
}
    
