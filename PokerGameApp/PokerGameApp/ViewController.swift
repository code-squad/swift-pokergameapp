//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let heartQ = Card(suit: .hearts, rank: .twelve)
    let spade7 = Card(suit: .spades, rank: .seven)
    var cardDeck = CardDeck()
    
    let pokerCardImage = UIImage(named: "card-back")
    let cardStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(heartQ)
        print(spade7)
        
        if let backgroundImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        add(numberOfCardViews: 7, to: cardStackView)
        setProperties(of: cardStackView)
        setConstraints(of: cardStackView)
    }
    
    func setProperties(of stackView: UIStackView) {
        self.view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5.0
    }
    
    func setConstraints(of view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    func add(numberOfCardViews: Int, to stackView: UIStackView) {
        for _ in 0..<numberOfCardViews {
            let pokerCardView = UIImageView(image: pokerCardImage)
            pokerCardView.translatesAutoresizingMaskIntoConstraints = false
            pokerCardView.heightAnchor.constraint(equalTo: pokerCardView.widthAnchor, multiplier: 1.27).isActive  = true
            stackView.addArrangedSubview(pokerCardView)
        }
    }
}
