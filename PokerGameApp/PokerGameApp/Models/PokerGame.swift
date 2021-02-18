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
    
    private var dealer = Dealer(cardDeck: CardDeck())
    private var players: [Player] = []
    
    func getDealerInfo() -> Dealer {
        return self.dealer
    }
    
    func getPlayersInfo() -> [Player] {
        return self.players
    }
    
    func start(gameMode: PokerGame.Mode, NumberOfPlayer: Int) {
        let cardCount = gameMode == .fiveStud ? NumberOfcards.five : NumberOfcards.seven
        
        func HandOutToPlayers(playerNumber index: Int) {
            let hand = Hand(cards: dealer.handOut(cardCount))
            let playerName = setPlayerName(index)
            let player = Player(hand: hand, name: playerName)
            players.append(player)
        }
        
        for index in 1...NumberOfPlayer {
            HandOutToPlayers(playerNumber: index)
        }
        
        dealer = hasAHandToDealer(dealer: dealer, cardCount: cardCount)
    }
}

private extension PokerGame {
    func setPlayerName(_ playerNumber: Int) -> String {
        return "참가자\(playerNumber)"
    }
    
    func hasAHandToDealer(dealer: Dealer, cardCount: Int) -> Dealer {
        let dealer = dealer
        return Dealer(cardDeck: dealer.takeRemainCards(), hand: Hand(cards: dealer.handOut(cardCount)))
    }
}
