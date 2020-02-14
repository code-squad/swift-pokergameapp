import XCTest

class PokerGameTests: XCTestCase {
    
    var pokerGame: PokerGame!
    
    override func setUp() {
        super.setUp()
        self.pokerGame = PokerGame(gameMode: .sevenCardStud, playerMode: .four)
    }

    func testPokerGameInitialize() {
        let participantCount = Mode.PlayerMode.four.rawValue
        
        XCTAssertEqual(self.pokerGame.participants.count, participantCount)
    }

    func testGiveCards() {
        pokerGame.giveCards()
        let randomIndex = Int.random(in: 0..<pokerGame.participants.count)
        var anotherRandomIndex = Int.random(in: 0..<pokerGame.participants.count)
        while anotherRandomIndex == randomIndex {
            anotherRandomIndex = Int.random(in: 0..<pokerGame.participants.count)
        }
        
        let participantCards = pokerGame.participants[randomIndex].cards
        let anotherParticipantCards = pokerGame.participants[anotherRandomIndex].cards
        
        XCTAssertNotEqual(participantCards, anotherParticipantCards)
        
        let dealerCards = pokerGame.dealer.cards
        
        XCTAssertNotEqual(participantCards, dealerCards)
    }

}
