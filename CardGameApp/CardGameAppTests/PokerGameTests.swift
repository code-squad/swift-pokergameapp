//
//  PokerGameTest.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//
import XCTest
@testable import CardGameApp
class PokerGameTests: XCTestCase {
    var game: PokerGame!

    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func testStartNewRound() {
        //1. given
        let gameStut = PokerGame.GameStut.five
        let playersNum = Players.PlayersNum.three
        let dealerCount = 1
        game = PokerGame(gameStut: gameStut, playersNum: playersNum)
        var originDeck = [Card]()
        game.searchDeck { (deck : Deck) in
            deck.searchCard {
                originDeck.append($0)
            }
        }
        
        //2. when
        game.startNewRound()
        
        //3. then
        var handedOutCards = [Card]()
        game.searchDealer { (dealer: Player) in
            dealer.searchCard {
                handedOutCards.append($0)
            }
        }
        game.searchPlayers { (player : Player) in
            player.searchCard {
                handedOutCards.append($0)
            }
        }
        
        var gameStutCount = 0
        gameStut.forEach {
            gameStutCount += 1
        }
        
        var playersNumCount = 0
        playersNum.forEach { 
            playersNumCount += 1
        }
        
        XCTAssertEqual(handedOutCards.count,
                       gameStutCount * (playersNumCount + dealerCount))
        game.searchDeck { (remainedDeck: Deck) in
            XCTAssertEqual(remainedDeck.count , originDeck.count - handedOutCards.count)
        }
    }
    
    func testHasEnoughCards() {
        //1. given
        game = PokerGame(gameStut: .seven, playersNum: .four)

        //2. when
        game.startNewRound() // remainedCards = 52 - 7 * 5 ( one is dealer) = 17

        //3. then
        XCTAssertFalse(game.hasEnoughCards())
    }
    
}
