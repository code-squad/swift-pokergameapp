//
//  ViewController.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/05.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var pokerGame: PokerGame!
    private var gameTypeControl: SegmentedControl!
    private var numberOfPlayersControl: SegmentedControl!
    private var gameTable = GameView()
    private var winnerMedal = WinnerMedalImageView()
    
    private var cardStacks: [UIStackView]!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        addGameTypeControl()
        addNumberOfPlayersControl()
        pokerGame = PokerGame()
        loadGame()
    }
    
    // MARK: - Make View
    
    private func resetGameTable() {
        gameTable.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        winnerMedal.removeFromSuperview()
    }
    
    private func loadGame() {
        pokerGame.play()
        resetGameTable()
        makeGame()
        var time = 0.5
        for index in 0..<cardStacks[0].arrangedSubviews.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                self.cardStacks.forEach {
                    $0.arrangedSubviews[index].alpha = 1
                }
            }
            time += 0.5
            if index == cardStacks[0].arrangedSubviews.count - 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                    self.addWinnerMedal(to: self.pokerGame.winner)
                }
            }
        }
    }
    
    private func addGameTypeControl() {
        gameTypeControl = SegmentedControl(items: ["7 Card", "5 Card"])
        view.addSubview(gameTypeControl)
        gameTypeControl.addTarget(self, action: #selector(segmentsChanged), for: .valueChanged)
        gameTypeControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
    }
    
    private func addNumberOfPlayersControl() {
        numberOfPlayersControl = SegmentedControl(items: ["2명", "3명", "4명"])
        view.addSubview(numberOfPlayersControl)
        numberOfPlayersControl.addTarget(self, action: #selector(segmentsChanged), for: .valueChanged)
        numberOfPlayersControl.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 10).isActive = true
    }
    
    private func makeGame() {
        cardStacks = [UIStackView]()
        pokerGame.forEachPlayers {
            let playerStack = PlayerStackView(playerName: "\($0)")
            let playerCards = makePlayerCard($0)
            playerStack.addArrangedSubview(playerCards)
            cardStacks.append(playerCards)
            gameTable.addArrangedSubview(playerStack)
        }
        self.view.addSubview(gameTable)
        gameTable.topAnchor.constraint(equalTo: gameTypeControl.bottomAnchor, constant: 50).isActive = true
    }
    
    private func makePlayerCard(_ player: Player) -> UIStackView {
        let cardStack = HandStackView()
        player.forEachCard {
            cardStack.addArrangedSubview(CardImageView(image: UIImage(named: "\($0).png")))
        }
        return cardStack
    }
    
    private func addWinnerMedal(to winnerIndex: Int) {
        self.view.addSubview(winnerMedal)
        winnerMedal.topAnchor.constraint(equalTo: gameTable.arrangedSubviews[winnerIndex].topAnchor, constant: 20).isActive = true
        winnerMedal.leftAnchor.constraint(equalTo: gameTable.rightAnchor, constant: 10).isActive = true
    }
    
    // MARK: - Event Processing
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        loadGame()
    }
    
    @objc
    private func segmentsChanged() {
        pokerGame = PokerGame(gameType: PokerGame.GameType(index: gameTypeControl.selectedSegmentIndex), numberOfPlayers: Players.NumberOfPlayers(index: numberOfPlayersControl.selectedSegmentIndex))
        loadGame()
    }
    
}
