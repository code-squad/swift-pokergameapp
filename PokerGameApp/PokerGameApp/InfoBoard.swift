//
//  InfoBoard.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/18.
//

import Foundation

class InfoBoard {
    
    private var participantsList: [String]
    private var cardStackList: [[Card]]
    
    init() {
        participantsList = []
        cardStackList = []
    }
    
    func update(participantsList newList: [String]) {
        participantsList = newList
    }
    
    func update(cardStackList newList: [[Card]]) {
        cardStackList = newList
    }
}
