//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class PokerGame {
    enum numbersOfPlayers : Int {
        case one = 1 , two, three, four
    }
    
    enum GameMode : Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
        
        func compareStudNumber(with target : Int) -> Bool {
            return self.rawValue == target
        }
        
        // 카드를 내려놓는 곳이 몇 개가 필요한지 세팅
        func setCardPlacement(of giveCard: ()-> ()) {
            for _ in 1 ... self.rawValue{ // 여기 바꿔야 함.
               giveCard()
            }
        }
    }
    private let gameMode: GameMode
    private let dealer : Dealer
    private var players : [Player] = []
    private let playersCount : Int
    
    init(dealer: Dealer, playersCount: Int, gameMode: GameMode) {
        self.gameMode = gameMode
        self.playersCount = playersCount
        self.dealer = dealer
        self.players = {
            for _ in 1 ... playersCount {
                let player = Player(in: gameMode)
                self.players.append(player)
            }
            return self.players
        }()
    }
    
    func start() {
    // 카드 분배
        gameMode.setCardPlacement {
            distributeCards()
        }
    }
    
    func distributeCards() {
        players.forEach{player in
            var nextCard = dealer.giveOneCard()
            player.addCard(newCard: nextCard)
        }
    }
    
    func isAllPlayersReady() -> Bool {
        return self.players.count == self.playersCount
    }
    
    func isAllPlayersCardsReady() -> Bool {
        var readyCheck = [Bool]()
        for player in self.players{
            readyCheck.append(player.isCardsFull())
        }
        let filteredReadycheck = readyCheck.filter{$0 == false}
        return filteredReadycheck.count == 0
    }
}
