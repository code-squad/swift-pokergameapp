import XCTest

class PokerGameTests: XCTestCase {
    
    var pokerGame: PokerGame!
    var participants: [Participant] = []
    
    override func setUp() {
        super.setUp()
        self.pokerGame = PokerGame(gameMode: .sevenCardStud, playerMode: .four)
        self.participants = pokerGame.showParticipants()
    }

    func testPokerGameInitialize() {
        let participantCount = Mode.PlayerMode.four.rawValue
        
        XCTAssertEqual(self.participants.count, participantCount)
    }

    func testGiveCards() {
        pokerGame.giveCards()
        let randomIndex = Int.random(in: 0..<self.participants.count)
        var anotherRandomIndex = Int.random(in: 0..<self.participants.count)
        while anotherRandomIndex == randomIndex {
            anotherRandomIndex = Int.random(in: 0..<self.participants.count)
        }
        
        let participantCards = self.participants[randomIndex].cards
        let anotherParticipantCards = self.participants[anotherRandomIndex].cards
        
        XCTAssertNotEqual(participantCards, anotherParticipantCards)
        
        let dealerCards = pokerGame.showDealer().cards
        
        XCTAssertNotEqual(participantCards, dealerCards)
    }

}
