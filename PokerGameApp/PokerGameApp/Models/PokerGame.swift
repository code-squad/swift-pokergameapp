//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

class PokerGame {
    enum Mode:String, CaseIterable {
        case sevenStud = "7 cards"
        case fiveStud = "5 cards"
    }
    
    enum NumberOfcards {
        static let seven = 7
        static let five = 5
    }
    
    enum NumberOfPalyer: String, CaseIterable {
        case two = "2명"
        case three = "3명"
        case four = "4명"
    }
    
    private var dealer = Dealer(cardDeck: CardDeck())
    lazy private var players: Players = Players(dealer: dealer, players: [])
    
    func start(gameMode: Mode, NumberOfPlayer: Int, completion: @escaping (Players) -> Void) {
        let cardCount = gameMode == .fiveStud ? NumberOfcards.five : NumberOfcards.seven
        
        func HandOutToPlayers(playerNumber index: Int) {
            let hand = Hand(cards: self.players.getDealerInfo().handOut(cardCount))
            let playerName = setPlayerName(index)
            let player = Player(hand: hand, name: playerName)
            self.players.appendPlayer(player)
        }
        
        for index in 1...NumberOfPlayer {
            HandOutToPlayers(playerNumber: index)
        }
        
        dealer = hasAHandToDealer(dealer: dealer, cardCount: cardCount)
        
        let players = Players(dealer: dealer, players: self.players.getPlayersInfo())
        completion(players)
    }
    
    func resetPlayers() {
        self.players = Players(dealer: Dealer(cardDeck: CardDeck()), players: [])
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
