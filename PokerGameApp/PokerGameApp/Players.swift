//
//  Player.swift
//  PokerGameApp
//
//  Created by user on 2021/02/18.
//

import Foundation

class Players : CustomStringConvertible {
    private var players: [Player]
    var totalPeopleNum: Int {
        return self.players.count
    }
    
    var description: String {
        var tempStr = ""
        for index in 0..<totalPeopleNum {
            tempStr += "참가자#\(index + 1) \(self.players[index])\n"
        }
        return tempStr
    }
    
    init() {
        self.players = []
    }
    
    func selectPlayerNum(_ playerNum: NumberOfPlayers) {
        self.players = []
        for _ in 0..<playerNum.rawValue {
            players.append(Player())
        }
    }
    
    //  인원수 만큼 가져온 카드를 플레이어들에게 한 장씩 나눠준다.
    func distributeEachCard(with cards: CardDeck) {
        var tempCards = cards
        
        for index in 0..<self.totalPeopleNum {
            if let card = tempCards.removeOne() {
                players[index].getOne(card)
            }
        }
    }
    
    func dropAllCards() {
        for index in 0..<self.totalPeopleNum {
            self.players[index].dropAllCards()
        }
    }
    
}
