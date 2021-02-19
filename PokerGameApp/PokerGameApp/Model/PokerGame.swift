//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/19.
//

import Foundation

enum PokerType {
    case five
    case seven
}

enum PlayerNumber: Int, CaseIterable {
    case one = 1, two, three, four
}

enum Round: Int {
    case first = 1, second, third, forth, fifth
}


class PokerGame {
    let cardNum: PokerType
    let playerNum: PlayerNumber
    let round: Round
    private var players: Players
    private var dealer: Dealer
    
    init(cardNum: PokerType, playerNum: PlayerNumber) {
        self.cardNum = cardNum
        self.playerNum = playerNum
        self.round = cardNum == .five ? Round.forth : Round.fifth
        self.players = Players(playerNum: self.playerNum)
        self.dealer = Dealer(cardNum: cardNum)
    }
    
    // 선택 버튼 1: 5-card-stud vs 7-card-stud
    // 선택 버튼 2: 배팅 금액 1 2 3 4 5
    
    func roundStart() {
        dealer.roundUp()
        
        dealer.getCard(from: dealer.deal())
        players.getCard(from: dealer)

        _ = dealer.cards
        _ = players.showCards()
    }
    
    func betting(who player: PlayerNumber, money: Int) {
        players.betting(who: player, money: money)
        _ = players.checkMoney()
    }
    
    func openCard(isFinal: Bool) {
        if isFinal {
            dealer.openCards()
            players.openCards()
        }
    }
    
    // 나중에 승자 판단 때 구현
    func judgeHighCard() -> [Int] {
        return [0,1,2,3,4]
    }    
}
