//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var deckForTest = CardDeck()
    var deckForGame = CardDeck()
    
    let segmentedControlStackView = UIStackView()
    let gameTypeSegmentedControl = UISegmentedControl()
    let numberOfPlayersSegmentedControl = UISegmentedControl()
    let playerStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testScenarios()
        
        if let backgroundImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        let dealer = Dealer(cardDeck: deckForGame)
        let players = Players(numberOfPlayers: 2)
        let myGame = PokerGame(dealer: dealer, players: players, gameType: .fiveCardStud)
        myGame.startGame()
        print(myGame)
        
        setProperties(of: segmentedControlStackView, axis: .vertical)
        segmentedControlStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        setConstraints(of: segmentedControlStackView, padding: 100.0)
        
        gameTypeSegmentedControl.insertSegment(withTitle: "7 Cards", at: 0, animated: true)
        gameTypeSegmentedControl.insertSegment(withTitle: "5 Cards", at: 1, animated: true)
        setProperties(of: gameTypeSegmentedControl)
        
        numberOfPlayersSegmentedControl.insertSegment(withTitle: "2명", at: 0, animated: true)
        numberOfPlayersSegmentedControl.insertSegment(withTitle: "3명", at: 1, animated: true)
        numberOfPlayersSegmentedControl.insertSegment(withTitle: "4명", at: 2, animated: true)
        setProperties(of: numberOfPlayersSegmentedControl)
        
        setProperties(of: playerStackView, axis: .vertical)
        playerStackView.distribution = .equalSpacing
        playerStackView.topAnchor.constraint(equalTo: segmentedControlStackView.bottomAnchor, constant: 5).isActive = true
        playerStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        setConstraints(of: playerStackView, padding: 0)
    }
    
    func setProperties(of stackView: UIStackView, axis: NSLayoutConstraint.Axis) {
        self.view.addSubview(stackView)
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5.0
    }
    
    func setProperties(of segmentedControl: UISegmentedControl) {
        segmentedControlStackView.addArrangedSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
    }
    
    func setConstraints(of view: UIView, padding: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: padding).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -padding).isActive = true
    }
    
    func makeCardView(from card: Card) -> UIImageView {
        let cardImage = UIImage(named: "\(card.suit)\(card.rank)")
        let cardView = UIImageView(image: cardImage)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive  = true
        return cardView
    }
    
    func testScenarios() {
        print(Test(testCase: .create, testDeck: deckForTest, expectedValue: 52))
        deckForTest.shuffle()
        print(Test(testCase: .shuffle, testDeck: deckForTest, expectedValue: 52))
        let _ = deckForTest.removeOne()
        print(Test(testCase: .removeOne, testDeck: deckForTest, expectedValue: 51))
        deckForTest.reset()
        print(Test(testCase: .reset, testDeck: deckForTest, expectedValue: 52))
    }
}
