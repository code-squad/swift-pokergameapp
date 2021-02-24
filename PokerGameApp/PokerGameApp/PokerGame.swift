//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by user on 2021/02/18.
//

import Foundation

class PokerGame {
    private var players: Players
    private var dealer: Dealer
    
    init() {
        self.dealer = Dealer()
        self.dealer.selectStud(.five)
        self.players = Players()
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
        print("\(self.dealer.currentStud())카드 기준, 참가자 \(self.players.totalPeopleNum)명 일 때")
        while self.dealer.checkEndGame(players.totalPeopleNum) {
            self.dealer.dropAllCards()
            self.players.dropAllCards()
            self.dealer.distributeCards(self.players)
            printAll()
        }
        print("게임이 종료되었습니다.\n")
    }
    
    func printAll() {
        print(self.players)
        print(self.dealer)
    }
    
    func playersInfo(closure: (Player) -> Void) {
        players.playerInfo(closure: closure)
    }
    
    func dealerCardsInfo(closure: (Dealer) -> Void) {
        closure(dealer)
    }
}
