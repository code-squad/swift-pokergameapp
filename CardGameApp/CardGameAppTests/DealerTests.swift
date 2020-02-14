import XCTest

class DealerTests: XCTestCase {
    var deck: Deck!
    var dealer: Dealer!
    
    override func setUp() {
        self.deck = CardGameFactory.createDeck()
        self.dealer = Dealer(deck: deck)
    }

    func testDealCardsOfOneRound() {
        let dealer = CardGameFactory.createDealer()
        let players = [Player(), Player()]
        dealer.dealCardsOfOneRound(players)
        
        
    }
}
