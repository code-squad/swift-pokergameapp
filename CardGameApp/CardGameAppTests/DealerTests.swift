import XCTest

class DealerTests: XCTestCase {
    var deck: Deck!
    var dealer: Dealer!
    
    override func setUp() {
        self.deck = CardGameFactory.createDeck()
        self.dealer = Dealer(deck: deck)
    }
    
    func testStartGameOfSevenStud() {
        let players = try! CardGameFactory.createPlayers(count: 4)
        let numberOfCards = Game.Rule.sevenStud.rawValue
        
        dealer.startGame(rule: .sevenStud, players: players)
        
        XCTAssertTrue(dealer.isReadyToGame(requiredCards: numberOfCards))
        
        let receivedCorrectly = players.filter { player in
            player.isReadyToGame(requiredCards: numberOfCards)
        }
        
        XCTAssertEqual(receivedCorrectly.count, players.count)
    }
    
    func testStartGameOfFiveStud() {
        let players = try! CardGameFactory.createPlayers(count: 2)
        let numberOfCards = Game.Rule.fiveStud.rawValue
        
        dealer.startGame(rule: .fiveStud, players: players)
        
        let receivedCorrectly = players.filter { $0.isReadyToGame(requiredCards: numberOfCards)
        }
        XCTAssertEqual(receivedCorrectly.count, players.count)
        XCTAssertTrue(dealer.isReadyToGame(requiredCards: numberOfCards))
    }
}
