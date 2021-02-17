//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

class PockerGame {
    public enum StudVariant {
        case fiveCardStud
        case sevenCardStud
    }

    private var cardDeck = CardDeck()
    private var dealer = Dealer()
    private var players: Array<Player> = []
    private var numberOfPlayers: Int
    private var numberOfCards: Int
    private var lackOfCard: Bool = false
    
    
    public init(withPlayersOf: Int, stud: StudVariant) {
        numberOfPlayers = withPlayersOf
        numberOfCards = stud == .fiveCardStud ? 5 : 7
    }
    
    private func welcomePlayer() {
        for i in 1...numberOfPlayers {
            players.append(Player(id: i))
        }
    }
    
    private func resetCardDeck() {
        cardDeck.reset()
        cardDeck.shuffle()
        print(cardDeck.count())
    }
    
    private func distribute() {
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
    
    public func gamePlay() {
        welcomePlayer()
        resetCardDeck()
        distribute()
        if lackOfCard == true {
            print("카드 수 부족")
            return
        }
        for player in players {
            print("\(player)")
        }
        print("\(dealer)")
        print("\(cardDeck.count())")
    }
}

