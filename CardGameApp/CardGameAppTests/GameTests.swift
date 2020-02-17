import XCTest

class GameTests: XCTestCase {
    func testCreateGame() {
        let players = try! Player.create(count: 4)
        let dealer = Dealer()
        let rule = SevenStudRule()
        XCTAssertNoThrow(try Game(rule: rule, dealer: dealer, players: players))
    }
    
    func testCreateGameSimply() {
        XCTAssertThrowsError(try Game(rule: FiveStudRule(), numberOfPlayers: 5))
        XCTAssertNoThrow(try Game(rule: FiveStudRule(), numberOfPlayers: 3))
    }
    
    func testSevenStud() {
        let players = try! Player.create(count: 4)
        let dealer = Dealer()
        let rule = SevenStudRule()
        let game = try! Game(rule: rule, dealer: dealer, players: players)
        
        game.start()
        let requiredCards = rule.requiredCards
        let playersToReady = players.filter { $0.isReadyToGame(requiredCards: requiredCards) }

        XCTAssertEqual(playersToReady.count, players.count)
    }
    
    func testFiveStud() {
        let players = try! Player.create(count: 3)
        let dealer = Dealer()
        let rule = FiveStudRule()
        let game = try! Game(rule: rule, dealer: dealer, players: players)
        
        game.start()
        let requiredCards = rule.requiredCards
        let playersToReady = players.filter { $0.isReadyToGame(requiredCards: requiredCards) }

        XCTAssertEqual(playersToReady.count, players.count)
    }
}

