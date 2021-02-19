//
//  Player.swift
//  PokerGameApp
//
//  Created by user on 2021/02/18.
//

import Foundation

class Players : CustomStringConvertible {
    private var players: [Player]
    private var dealer: Dealer
    var totalPeopleNum: Int {
        return self.players.count + 1
    }
    
    var description: String {
        var tempStr = ""
        for index in 0..<totalPeopleNum - 1 {
            tempStr += "참가자#\(index + 1) \(self.players[index])\n"
        }
        return tempStr + "딜러 \(self.dealer)"
    }
    
    init(_ dealer: Dealer) {
        self.players = []
        self.dealer = dealer
    }
    
    func selectPlayerNum(_ playerNum: NumberOfPlayers) {
        self.players = []
        for _ in 0..<playerNum.rawValue {
            players.append(Player())
        }
    }
    
    //  인원수 만큼 가져온 카드를 플레이어들에게 한 장씩 나눠준다.
    func eachPlayersGetCards(_ cards: CardDeck) {
        var tempCards = cards
        
        if let card = tempCards.removeOne() {
            dealer.getOne(card)
        }
        
        for index in 0..<self.totalPeopleNum - 1 {
            if let card = tempCards.removeOne() {
                players[index].getOne(card)
            }
        }
    }
    
    func dropAllCards() {
        self.dealer.dropAll()
        for index in 0..<self.totalPeopleNum - 1 {
            self.players[index].dropAll()
        }
    }
    
}
