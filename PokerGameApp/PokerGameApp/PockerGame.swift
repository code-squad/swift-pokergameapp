//
//  Player.swift
//  PokerGameApp
//
//  Created by jinseo park on 3/16/21.
//

import Foundation

/*
 요구사항
 게임 타입 = 5스타터, 7스타터
 사람 = 딜러(init), 플레이어 (Min: 1, max: 4)
 */

enum PockerGameError : Error {
    case initError
}
enum GameType : Int {
    case FiveStarter = 5
    case SevenStarter = 7
}

fileprivate var DEALER : Int = 1
fileprivate var MINPLAYER : Int = 1
fileprivate var MAXPLAYER : Int = 4

class PockerGame {
    
    var deck = CardDeck()
    var totalPlayers : [Person] = [Person.init(.Dealer)] /*딜러는 무조건 존재하기 때문에.*/
    var typeOfGame : GameType
    
    /* 총 플레이어 수와 게임 타입을 정해야 한다.*/
    init(_ totalPlayers : Int , _ typeOfGame : GameType ) throws {
        if totalPlayers < MINPLAYER || totalPlayers > MAXPLAYER {
            throw PockerGameError.initError
        }else {
            self.totalPlayers.append(Person.init(.Player))
            self.typeOfGame = typeOfGame
        }
    }
    
    /*모든 플레이어에게 게임타입별 카드개수를 나누어 준다.*/
    func giveCardsToPlayerNDealer() {
        for player in 0 ..< self.totalPlayers.count {
            for _ in 0 ..< self.typeOfGame.rawValue {
                self.totalPlayers[player].cardsInHand.append(deck.pickOneCard())
            }
        }
    }
    
}
