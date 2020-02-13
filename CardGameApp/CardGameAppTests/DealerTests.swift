import XCTest

class DealerTests: XCTestCase {
    var deck: Deck!
    var dealer: Dealer!
    
    override func setUp() {
        self.deck = CardGameFactory.createDeck()
        self.dealer = Dealer(deck: deck)
    }
    
    func testDealCard() {
        let players = [Player(), Player(), Player(), Player()]
        let card = deck.removeOne()!
        let player = players.first!
        
        dealer.give(card: card, to: player)
        
        XCTAssertEqual(player.cards.count, 1)
    }
    
    func testStartGameOfSevenStud() {
        let players = try! CardGameFactory.createPlayers(count: 4)
        let numberOfCards = Game.Rule.sevenStud.rawValue
        
        dealer.startGame(rule: .sevenStud, players: players)
        
        print(dealer.cards)
        XCTAssertEqual(dealer.cards.count, numberOfCards)
        
        let receivedCorrectly = players.filter { player in
            print(player.cards)
            return player.cards.count == numberOfCards
        }
        
        XCTAssertEqual(receivedCorrectly.count, players.count)
    }
    
    func testStartGameOfFiveStud() {
        let players = try! CardGameFactory.createPlayers(count: 2)
        let numberOfCards = Game.Rule.fiveStud.rawValue
        
        dealer.startGame(rule: .fiveStud, players: players)
        
        let receivedCorrectly = players.filter { $0.cards.count == numberOfCards }
        XCTAssertEqual(receivedCorrectly.count, players.count)
        XCTAssertEqual(dealer.cards.count, numberOfCards)
    }
}
