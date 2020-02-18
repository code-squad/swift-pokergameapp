//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Playerable {
    func receiveCard(sender: () -> (card : Card?, error : Error?)) throws 
}

class Player: Playerable , Searchable {
    
    private var cards : [Card]?
    
    func receiveCard(sender: () -> (card : Card?, error: Error?)) throws {
        if let error = sender().error {
            throw error
        }
        
        let card = sender().card!
        cards?.append(card)
    }
    
    func initCards() {
        cards = [Card]()
    }
    
    func searchCard(handler: (Card) -> ()) {
        if let cards = cards {
            _ = cards.map { handler($0) }
        }
    }
    
}
