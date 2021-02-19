//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/19.
//

import Foundation

class PokerGame {
    let cardNum: Int
    let playerNum: Int
    private let round: Int
    private var players: [Player] = []
    private var dealer: Dealer
    
    init(cardNum: Int, playerNum: Int) {
        self.cardNum = cardNum
        self.playerNum = playerNum
        self.round = cardNum == 5 ? 4 : 5
        for number in 1...playerNum {
            players.append(Player(index: number))
        }
        self.dealer = Dealer(cardNum: cardNum)
    }
    
    func playGame() {
        for round in 1...round {
            
            deal()
            showCards()
            betting()
            checkMoney()
            // last round -> comprehensive judgment
            if round == self.round {
                openCards()
            }
            // highCard sequence
            _ = judgeHighCard()
        }
    }
    
    func deal() {
        print("👉🏻 1. deal")
        dealer.getCard()
        players.forEach { player in
            player.getCard(from: dealer.deal())
        }
    }
    
    func showCards() {
        print("👉🏻 2. show")
        print(dealer.myCard)
        players.forEach { player in
            print(player.cards)
        }
    }
    
    // 나중에 버튼으로 배팅 구현하려고 우선 readLine() 썼더니, iOS 에선 안 돌아가네요...ㅠㅠ 일단 생략!
    func betting() {
        print("👉🏻 3. betting")
        for player in players {
            print("> bet money: ")
            let betting = Int(readLine() ?? "") ?? 0
            player.bet(money: betting)
        }
    }
    
    func checkMoney() {
        print("👉🏻 4. check money")
        players.forEach { player in
            print(player.index, player.betting)
        }
    }
    
    func openCards() {
        print("👉🏻 4. open card")
        dealer.openCard()
        print(dealer.myCard)
        players.forEach { player in
            player.openCard()
            print(player.cards)
        }
    }
    
    // 나중에 승자 판단 때 구현
    func judgeHighCard() -> [Int] {
        
        return [0,1,2,3,4]
    }    
}
