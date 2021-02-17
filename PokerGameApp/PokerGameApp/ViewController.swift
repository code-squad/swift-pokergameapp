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
    let alice = Dealer()
    let bob = Player()
    let carol = Player()
    let david = Player()
    
    let pokerCardImage = UIImage(named: "card-back")
    let cardStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(heartQ)
        print(spade7)
        testScenarios()
        
        if let backgroundImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        do {
            let myGame = try PokerGame(dealer: alice, players: [bob, carol, david], gameType: .fiveCardStud)
            myGame.startGame()
            print(myGame)
        } catch PokerGameError.tooFewPlayers {
            print("게임 참가자가 부족해요🥺 1명 이상 참여해야 합니다.")
        } catch PokerGameError.tooManyPlayers(let playersNeededToLeave) {
            print("게임 참가자가 너무 많아요😵 \(playersNeededToLeave)명의 참가자는 다음 게임을 이용해주세요.")
        } catch {
            print("예상치 못한 에러가 발생했어요😢: \(error)")
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
    
    func testScenarios() {
        print(Test(testCase: .create, testDeck: cardDeck, expectedValue: 52))
        cardDeck.shuffle()
        print(Test(testCase: .shuffle, testDeck: cardDeck, expectedValue: 52))
        let _ = cardDeck.removeOne()
        print(Test(testCase: .removeOne, testDeck: cardDeck, expectedValue: 51))
        cardDeck.reset()
        print(Test(testCase: .reset, testDeck: cardDeck, expectedValue: 52))
    }
}
