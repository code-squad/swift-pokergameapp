//
//  GameMakePlayers.swift
//  CardGame
//
//  Created by Elena on 31/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameMakePlayers {
    
    private var gamePlayers: [GamePlayer] = []
    private var dealer: Dealer
    
    init(players: Int) {
        self.dealer = Dealer(CardDeck())
        setPlayers(add: players)
    }
    
    //gamePlayers reset 하려고 만든 함수
    func gamePlayersReset() {
        for player in gamePlayers {
            player.resetCards()
        }
        self.dealer.resetCards()
    }
    
    // 입력받은 참가자 추가하기 위한 함수
    mutating func setPlayers(add players: Int) {
        for _ in 0..<players {
            let player = Player()
            gamePlayers.append(player)
        }
    }
    
    // 모드에 따라 참여한 사람에게 모드 수만큼의 카드를 나누어준다.
    func sendRound(_ mode: Int) -> Bool {
        for _ in 0..<mode {
            for player in gamePlayers {
                guard let card = dealer.removeDeal() else { return false }
                player.take(card: card)
            }
        }
        return true
    }
    
    //isDealer? ,number,cards 내용을 결과돌려줌
    func showResult(_ result: (Bool, Int, String) -> Void) {
        for index in gamePlayers.indices {
            let isDealer = gamePlayers[index] is Dealer
            let number = index
            let cards = gamePlayers[index].showCards()
            result(isDealer, number, cards)
        }
    }
    
    // 카드 갯수 확인
    func isLimitCards(_ gameMode: GameMode) -> Bool {
        return dealer.enoughCards(player: gamePlayers.count, modeCardNumber: gameMode)
    }
    
    // 플레이어랑 딜러를 배열에 담아서 그 숫자만큼 한명씩 카드를 나눠주기 위해서 -> showResults 를 호출한다.
    // playersWithDealer 는 게임참여하는 사람 , for문을 돌면서 1장씩 나눠준다.
    func sendRoundCards(_ cards: resultNameCard) -> Bool {
        var playersWithDealer: [GamePlayer] = gamePlayers
        playersWithDealer.append(dealer)
        for player in playersWithDealer {
            guard let card = dealer.removeDeal() else { return false }
            player.take(card: card)
            showResults(cards)
            sleep(1)
        }
        return true
    }
    
    //참가자와 딜러의 카드를 한장씩 반환해주는 함수
    private func showResults(_ result: resultNameCard) {
                                 //gamePlayers.count-1
        for index in gamePlayers.indices {
            let name = "\(gamePlayers[index].name)#\(index+1)"
            let cards = gamePlayers[index].showCards()
            result(name, cards)
        }
        result(dealer.name, dealer.showCards())
    }
    
    // 딜러가 우승일까?
    private func dealerWin(_ player: GamePlayer) -> Bool? {
        guard let bestDealer = dealer.winnerHand else { return nil }
        guard let bestPlayer = player.winnerHand else { return nil }
        return bestPlayer < bestDealer
    }
    
    // 승자를 찾는 함수
    private func findWinnerPlayer() -> (winner: GamePlayer, number: Int)? {
        guard var winner = gamePlayers.first else { return nil }
        var number = 0
        for index in gamePlayers.indices {
            
            guard let bestWinner = winner.winnerHand else { continue }
            guard let bestPlayer = gamePlayers[index].winnerHand else { continue }
            if bestWinner < bestPlayer {
                winner = gamePlayers[index]
                number = index
            }
        }
        return (winner, number)
    }
    
    //승리한 사람 이름 저장 ( 딜러 , 참가자 다른표현 때문에 분리)
    func winnerNameStorage(_ winner: resultName) {
        if let result = findWinnerPlayer() {
            guard let dealerWins = dealerWin(result.winner) else { return }
            if dealerWins {
                winner(dealer.name)
            } else {
                winner("\(result.winner.name)\(result.number+1)")
            }
            sleep(1)
        }
    }

}
