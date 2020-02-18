//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol Playerable {
    func receiveCard (sender: () -> (Result<Card,Error>)) throws
}

class Player: Playerable , Searchable {
    
    private var cards = [Card]()
    
    func reset() {
        cards = [Card]()
    }
    
    func receiveCard(sender: () -> (Result<Card, Error>)) throws {
        let result = sender()
        
        switch result {
        case .success(let card):
            cards.append(card)
        case .failure(let error):
            throw error
        }
    }
    
    func searchCard(handler: (Card) -> ()) {
        cards.forEach{ handler($0) }
    }
}
