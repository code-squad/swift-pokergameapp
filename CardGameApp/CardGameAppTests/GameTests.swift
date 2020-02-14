import XCTest

class GameTests: XCTestCase {
    func testCreatePlayers() {
        XCTAssertThrowsError(try CardGameFactory.createPlayers(count: 0))
        XCTAssertNoThrow(try CardGameFactory.createPlayers(count: 1))
        XCTAssertNoThrow(try CardGameFactory.createPlayers(count: 5))
    }
    
    func testCreateGame() {
        var players = try! CardGameFactory.createPlayers(count: 5)
        let dealer = CardGameFactory.createDealer()
        XCTAssertThrowsError(try Game(rule: .fiveStud, dealer: dealer, players: players))
        players = try! CardGameFactory.createPlayers(count: 3)
        XCTAssertNoThrow(try Game(rule: .fiveStud, dealer: dealer, players: players))
    }
    
    func testSevenStud() {
        let players = try! CardGameFactory.createPlayers(count: 4)
        let dealer = CardGameFactory.createDealer()
        let game = try! Game(rule: .sevenStud, dealer: dealer, players: players)
        
        game.start()
        let requiredCards = Rule.sevenStud.requiredCards
        let playersToReady = players.filter { $0.isReadyToGame(requiredCards: requiredCards) }

        XCTAssertEqual(playersToReady.count, players.count)
    }
    
    func testFiveStud() {
        let players = try! CardGameFactory.createPlayers(count: 3)
        let dealer = CardGameFactory.createDealer()
        let game = try! Game(rule: .fiveStud, dealer: dealer, players: players)
        
        game.start()
        let requiredCards = Rule.fiveStud.requiredCards
        let playersToReady = players.filter { $0.isReadyToGame(requiredCards: requiredCards) }

        XCTAssertEqual(playersToReady.count, players.count)
    }
}

