//
//  Players.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/19.
//

import Foundation

class Players {
    private var players: [Playable]
    private (set) var count: Int
    
    init(players: [Playable]) {
        self.players = players
        self.count = 0
    }

    func appendPlayer(_ player: Playable) {
        players.append(player)
        updateCount()
    }
    
    func forEachPlayers(behavior: (Playable) -> ()) {
        players.forEach { player in
            behavior(player)
        }
    }
    
    private func updateCount() {
        self.count = players.count
    }
    
    func registerPlayers(numberOfPlayers: Int, cardCount: Int) {
        var dealer = Dealer(cardDeck: CardDeck())
        
        for index in 1...numberOfPlayers {
            let hand = Hand(cards: dealer.handOut(cardCount))
            let playerName = setPlayerName(index)
            let player = Player(hand: hand, name: playerName)
            appendPlayer(player)
        }
        
        dealer = hasAHandToDealer(dealer: dealer, cardCount: cardCount)
        appendPlayer(dealer)
    }
    
    private func setPlayerName(_ playerNumber: Int) -> String {
        return "참가자\(playerNumber)"
    }
    
    private func hasAHandToDealer(dealer: Dealer, cardCount: Int) -> Dealer {
        let dealer = dealer
        return Dealer(cardDeck: dealer.takeRemainCards(), hand: Hand(cards: dealer.handOut(cardCount)))
    }
    
    func resetPlayers() {
        players = [Playable]()
    }
}
