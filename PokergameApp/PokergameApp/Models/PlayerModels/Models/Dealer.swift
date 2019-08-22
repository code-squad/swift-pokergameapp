//
//  Dealer.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

class Dealer: Player{
    private var myHand : Hand = Hand()
    private var name: String
    
    var deck: CardDeck = CardDeck.init()
    override init(_ name: String = "Dealer") {
        self.name = name
        super.init(name)
    }
}

extension Dealer : Dealable{
    func distributeCards(_ players: [Playable], gameType: GameType) {
        if gameType.rawValue * players.count > deck.deckSize {
            print(SystemMessage.autoInitializeDeck)
            deck.reset()
        }
        switch gameType {
        case .fiveCard:
            for time in 0..<gameType.rawValue {
                distributeEachCard(players)
            }
        case .sevenCard:
            for time in 0..<gameType.rawValue {
                distributeEachCard(players)
            }
        }
    }
    
    func distributeEachCard(_ players: [Playable]) {
        players.forEach { (player) in
            do {
                let drawCard = try deck.removeOne().get()
                player.receiveCard(drawCard)
            } catch let drawError as DrawCardError {
                print(drawError.description)
                deck.reset()
            } catch{
                print(error.localizedDescription)
            }
        }
    }
}
