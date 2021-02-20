//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

class PokerGame {
    private var cardDeck = CardDeck()
    private var dealer = Dealer()
    private var players: Players
    private var numberOfCards: Int
    private var lackOfCard: Bool

    public init(playersOf: Int, stud: Int) {
        players = Players(with: playersOf)
        numberOfCards = stud
        lackOfCard = false
    }
    
    private func resetCardDeck() {
        cardDeck.reset()
        cardDeck.shuffle()
        print(cardDeck.count())
    }
    
    private func distribute() {
        for _ in 1...numberOfCards {
            players.cardForAll(cards: cardDeck)
            
            if let drawnCard = cardDeck.removeOne() {
                dealer.receive(card: drawnCard)
            } else {
                lackOfCard = true
                return
            }
        }
    }
    
    public func play() -> Array<Array<Card>>? {
        players.resetPlayers()
        dealer.resetDealer()
        resetCardDeck()
        distribute()
        if lackOfCard == true {
            print("카드 수 부족")
            return nil
        }
        print("\(players)")
        print("\(dealer)")
        print("\(cardDeck.count())")
        
        var cardDashboard: Array<Array<Card>> = players.giveCardInfoOfPlayers()
        cardDashboard.append(dealer.cardInfo())
        return cardDashboard
    }
}

