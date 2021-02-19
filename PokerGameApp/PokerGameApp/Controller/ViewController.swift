//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    var cardDeck = CardDeck()
    var game = PokerGame(withPlayersOf: .four, stud: .sevenCardStud)
    
    let dashboardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundPatternImage: UIImage = UIImage(named: "bg_pattern") ?? UIImage()
        let cardBacksideImage: UIImage = UIImage(named: "card-back") ?? UIImage()
        self.view.backgroundColor = UIColor(patternImage: backgroundPatternImage)
        
        self.view.addSubview(dashboardStackView)
        configureDashboardStackView()
        guard let gameResult = game.play() else { return }
        addSubviewToDashboardStackView(with: gameResult, to: dashboardStackView)
    }
    
    func configureDashboardStackView() {
        dashboardStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dashboardStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        dashboardStackView.widthAnchor.constraint(lessThanOrEqualTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
    }
    func addSubviewToDashboardStackView(with gameResult: Array<Array<Card>>, to verticalStackView: UIStackView) {
        for playerResult in gameResult {
            let newStackView = makeHorizontalCardStack()
            verticalStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09 * CGFloat(gameResult.count)).isActive = true
            addCardsToHorizontalCardStack(cards: playerResult, to: newStackView)
            verticalStackView.addArrangedSubview(newStackView)
        }
    }
  
    func addCardsToHorizontalCardStack(cards: Array<Card>, to stackView: UIStackView) {
        for card in cards {
            let newCardImageView = card.makeCardImageView()
            stackView.addArrangedSubview(newCardImageView)
        }
        let prizeImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "card-back") ?? UIImage()
            return imageView
        }()
        stackView.addArrangedSubview(prizeImageView)
    }
    
    func makeHorizontalCardStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = -20
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }
}
    
