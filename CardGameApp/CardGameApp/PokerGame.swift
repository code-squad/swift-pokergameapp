//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class PokerGame {
    enum NumbersOfPlayers : Int {
        case one = 1 , two, three, four
        
        // 플레이어의 자리가 몇 개가 필요한지 세팅
        func setPlayerSeat(for bringPlayer: () -> ()) {
            for _ in 1 ... self.rawValue {
                bringPlayer()
            }
        }
    }
    
    enum GameMode : Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
        
        func compareStudNumber(with target : Int) -> Bool {
            return self.rawValue == target
        }
        
        // 카드를 내려놓는 곳이 몇 개가 필요한지 세팅
        func setCardPlacement(of giveCard: ()-> ()) {
            for _ in 1 ... self.rawValue{
               giveCard()
            }
        }
    }
    private let gameMode: GameMode
    private let dealer : Dealer
    private var players : [Player] = []
    private let numbersOfPlayers : NumbersOfPlayers
    
    init(dealer: Dealer, numbersOfPlayers: NumbersOfPlayers, gameMode: GameMode) {
        self.gameMode = gameMode
        self.numbersOfPlayers = numbersOfPlayers
        self.dealer = dealer
        self.players = {
            numbersOfPlayers.setPlayerSeat(for: {
                let player = Player(in: gameMode)
                self.players.append(player)
                }
            )
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
    
    func isAllPlayersCardsReady() -> Bool {
        var readyCheck = [Bool]()
        for player in self.players{
            readyCheck.append(player.isCardsFull())
        }
        let filteredReadycheck = readyCheck.filter{$0 == false}
        return filteredReadycheck.count == 0
    }
}
