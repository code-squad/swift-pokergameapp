//
//  Player.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

class Player {
    private var myHand : Hand = Hand()
    private var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

extension Player: Playable{
    var score : Int {
        get {
            return self.myHand.calculateEachPlayerHand()
        }
    }
    var presentName : String {
        return self.name
    }
    
    func resetHand() {
        self.myHand.clear()
    }
    
    func receiveCard(_ card: Card){
        myHand.receiveCard(card)
    }
    
    func receivePrintFormat(_ format: (_ name: String, _ hand: Hand ) -> Void ){
        format(name, myHand)
    }
}

extension Player: Comparable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.score == rhs.score
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score < rhs.score
    }
}


