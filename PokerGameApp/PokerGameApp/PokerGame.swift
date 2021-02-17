//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

class pockerGame {
    var cardDeck = CardDeck()
    var playersArray: Array<Player> = []
    var lackOfCard: Bool = false
    
    func welcomePlayer(numberOfPlayers: Int) {
        for i in 1...numberOfPlayers {
            playersArray.append(Player(id: i))
        }
    }
    
    func restartGame() {
        cardDeck.reset()
        cardDeck.shuffle()
        print(cardDeck.count())
    }
    
    func distributeCard() {
        for player in playersArray {
            if let drawnCard = cardDeck.removeOne() {
                player.receive(card: drawnCard)
            } else {
                lackOfCard = true
            }
        }
    }
    
    func gamePlay() {
        welcomePlayer(numberOfPlayers: 4)
        restartGame()
        (1...5).forEach { (_) in
            distributeCard()
        }
        if lackOfCard == true {
            print("카드 수 부족")
            return
        }
        for player in playersArray {
            print("\(player)")
        }
    }
}

