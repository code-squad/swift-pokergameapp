//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

class PokerGame {
    enum Mode {
        case sevenStud, fiveStud
    }
    
    enum NumberOfcards {
        static let seven = 7
        static let five = 5
    }
    
    class func start(gameMode: PokerGame.Mode, NumberOfPlayer: Int) {
        let cardCount = gameMode == .fiveStud ? NumberOfcards.five : NumberOfcards.seven
        var dealer: Dealer = Dealer(cardDeck: CardDeck())
        var players: [Player] = []
        
        func HandOutToPlayers(playerNumber index: Int) {
            let hand = Hand(cards: dealer.handOut(cardCount))
            let playerName = setPlayerName(index)
            let player = Player(hand: hand, name: playerName)
            players.append(player)
        }
        
        for index in 1...NumberOfPlayer {
            HandOutToPlayers(playerNumber: index)
        }
        
        dealer = hasAHand(dealer: dealer, cardCount: cardCount)
    }
}

private extension PokerGame {
    static func setPlayerName(_ playerNumber: Int) -> String {
        return "참가자\(playerNumber)"
    }
    
    static func hasAHand(dealer: Dealer, cardCount: Int) -> Dealer {
        let dealer = dealer
        return Dealer(cardDeck: dealer.remainCards, hand: Hand(cards: dealer.handOut(cardCount)))
    }
}
