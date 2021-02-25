//
//  Dealer.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/17.
//

import Foundation

class Dealer: Playable {
    private var cardDeck: CardDeck
    private var hand: Hand
    let name = "딜러"
    
    init(cardDeck: CardDeck, hand: Hand) {
        self.cardDeck = cardDeck
        self.hand = hand
    }
    
    convenience init(cardDeck: CardDeck) {
        self.init(cardDeck: cardDeck, hand: Hand(cards: []))
    }
    
    func takeRemainCards() -> CardDeck {
        return cardDeck
    }
    
    func handOut(_ numberOfCards: Int) -> [Card] {
        var cards: [Card] = []
        self.cardDeck.shuffle()

        for _ in 0..<numberOfCards {
            guard self.cardDeck.count() > 0 else {
                continue
            }
            cards.append(self.cardDeck.removeOne())
        }

        return cards
    }
    
    func calcHandKind() -> (Int, Set<Rank>) {
        return (hand.judge()?.rawValue ?? 0, hand.combiCardRank)
    }
    
    func forEachPlayer(behavior: (Hand) -> ()) {
        behavior(hand)
    }
}
