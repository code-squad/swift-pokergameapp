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
    
    func findPlayableWithHighestHands() -> Playable? {
        guard var winner: Playable = players.last else { return nil }
        
        players.forEach { playable in
            winner = rankHandsKind(playable: playable, winner: winner)
        }

        return winner
    }

    private func rankHandsKind(playable: Playable, winner: Playable) -> Playable {
        guard playable.calcHandKind().0 == winner.calcHandKind().0 else {
            return playable.calcHandKind().0 > winner.calcHandKind().0 ? playable : winner
        }

        guard playable.calcHandKind().0 != 2 else {
            return playable.calcHandKind().1.first?.rawValue ?? 0
                > winner.calcHandKind().1.first?.rawValue ?? 0
                ? playable : winner
        }

        return playable.calcHandKind().1.first?.rawValue ?? 0
            > winner.calcHandKind().1.first?.rawValue ?? 0
            ? playable : winner
    }
}
