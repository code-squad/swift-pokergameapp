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
        let gameStut = GameStut.five
        let participants = Participants(playersNumber: .three)
        game = PokerGame(gameStut: gameStut,
                         participants: participants,
                         deck: Deck())
        
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
        game.participants.searchParticipants { (participant) -> (Void) in
            participant.searchCard { (card) in
                handedOutCards.append(card)
            }
        }
        
        var gameStutCount = 0
        gameStut.forEach {
            gameStutCount += 1
        }
        
        let participantsCount = participants.count
        
        XCTAssertEqual(handedOutCards.count,
                       gameStutCount * participantsCount)
        
        game.searchDeck { (remainedDeck: Deck) in
            XCTAssertEqual(remainedDeck.count ,
                           originDeck.count - handedOutCards.count)
        }
        
    }
    
    func testHasEnoughCards() {
        
        //1. given
        game = PokerGame(gameStut: .seven,
                         participants: Participants(playersNumber: .four),
                         deck: Deck())
        //2. when
        game.startNewRound()

        //3. then
        XCTAssertFalse(game.hasEnoughCards())
        
    }
    
}
