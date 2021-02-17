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
    private var paticipants: Array<Player>
    private var numberOfCards: Int
    private var lackOfCard: Bool = false
    
    public init(withPlayersOf: Int, stud: StudVariant) {
        paticipants = Players(numberOfPlayers: withPlayersOf).players
        numberOfCards = stud == .fiveCardStud ? 5 : 7
    }
    
    private func resetCardDeck() {
        cardDeck.reset()
        cardDeck.shuffle()
        print(cardDeck.count())
    }
    
    private func distribute() {
        for _ in 1...numberOfCards {
            for player in paticipants {
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
        resetCardDeck()
        distribute()
        if lackOfCard == true {
            print("카드 수 부족")
            return
        }
        for player in paticipants {
            print("\(player)")
        }
        print("\(dealer)")
        print("\(cardDeck.count())")
    }
}

