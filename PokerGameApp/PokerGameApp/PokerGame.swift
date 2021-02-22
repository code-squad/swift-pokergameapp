//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by user on 2021/02/18.
//

import Foundation

class PokerGame {
    var players: Players
    var dealer: Dealer
    
    init() {
        self.dealer = Dealer()
        self.dealer.selectStud(.five)
        self.players = Players.init(self.dealer)
        self.players.selectPlayerNum(.two)
    }
    
    func selectStud(stud: Stud) {
        self.dealer.selectStud(stud)
    }
    
    func selectPlayers(numberOfPlayers: NumberOfPlayers) {
        self.players.selectPlayerNum(numberOfPlayers)
    }
    
    func startGame() {
        self.dealer.resetCardDeck()
        print("\(self.dealer.currentStud())카드 기준, 참가자 \(self.players.totalPeopleNum - 1)명 일 때")
        while self.dealer.distributeCards(self.players) {
            printAll()
            self.players.dropAllCards()
        }
        self.players.dropAllCards()
        print("게임이 종료되었습니다.\n")
    }
    
    func printAll() {
        print(self.players)
    }
}
