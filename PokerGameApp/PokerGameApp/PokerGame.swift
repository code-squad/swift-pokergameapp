//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

class Dealer: CardDeck {
    var dealerDeck: Array<Card>?
    
    public func receive(card: Card) {
        if dealerDeck != nil {
            dealerDeck?.append(card)
        } else {
            dealerDeck = [card]
        }
    }
}

class PockerGame {
    var cardDeck = CardDeck()
    var dealer = Dealer()
    var players: Array<Player> = []
    var lackOfCard: Bool = false
    
    func welcomePlayer(numberOfPlayers: Int) {
        for i in 1...numberOfPlayers {
            players.append(Player(id: i))
        }
    }
    
    func restartGame() {
        cardDeck.reset()
        cardDeck.shuffle()
        print(cardDeck.count())
    }
    
    func distribute(numberOfCards: Int) {
        for _ in 1...numberOfCards {
            for player in players {
                if let drawnCard = cardDeck.removeOne() {
                    player.receive(card: drawnCard)
                } else {
                    lackOfCard = true
                }
            }
            if let drawnCard = cardDeck.removeOne() {
                dealer.receive(card: drawnCard)
            } else {
                lackOfCard = true
            }
        }
    }
    
    func gamePlay() {
        welcomePlayer(numberOfPlayers: 1)
        restartGame()
        distribute(numberOfCards: 7)
        if lackOfCard == true {
            print("카드 수 부족")
            return
        }
        for player in players {
            print("\(player)")
        }
        print("\(dealer)")
    }
}

extension Dealer: CustomStringConvertible {
    var description: String {
        return "딜러 \(dealerDeck ?? [])"
    }
}
