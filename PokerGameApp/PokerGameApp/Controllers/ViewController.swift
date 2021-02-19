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
    
    let cardStackView = UIStackView()
    let segmentedControlStackView = UIStackView()
    let gameTypeSegmentedControl = UISegmentedControl()
    let numberOfPlayersSegmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testScenarios()
        
        if let backgroundImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        let dealer = Dealer(cardDeck: deckForGame)
        let players = Players(numberOfPlayers: 2)
        do {
            let myGame = try PokerGame(dealer: dealer, players: players, gameType: .fiveCardStud)
            myGame.startGame()
            print(myGame)
        } catch PokerGame.PokerGameError.tooFewPlayers {
            print("게임 참가자가 부족해요🥺 1명 이상 참여해야 합니다.")
        } catch PokerGame.PokerGameError.tooManyPlayers(let playersNeededToLeave) {
            print("게임 참가자가 너무 많아요😵 \(playersNeededToLeave)명의 참가자는 다음 게임을 이용해주세요.")
        } catch {
            print("예상치 못한 에러가 발생했어요😢: \(error)")
        }
        
        setProperties(of: segmentedControlStackView, axis: .vertical)
        setConstraints(of: segmentedControlStackView)
        
        gameTypeSegmentedControl.insertSegment(withTitle: "7 Cards", at: 0, animated: true)
        gameTypeSegmentedControl.insertSegment(withTitle: "5 Cards", at: 1, animated: true)
        setProperties(of: gameTypeSegmentedControl)
        
        numberOfPlayersSegmentedControl.insertSegment(withTitle: "2명", at: 0, animated: true)
        numberOfPlayersSegmentedControl.insertSegment(withTitle: "3명", at: 1, animated: true)
        numberOfPlayersSegmentedControl.insertSegment(withTitle: "4명", at: 2, animated: true)
        setProperties(of: numberOfPlayersSegmentedControl)
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
    
    func setConstraints(of view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 100.0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -100.0).isActive = true
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
