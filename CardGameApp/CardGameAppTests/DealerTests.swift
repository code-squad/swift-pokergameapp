import XCTest

class DealerTests: XCTestCase {
    var deck: Deck!
    var dealer: Dealer!
    
    override func setUp() {
        self.deck = Deck()
        self.dealer = Dealer(deck: deck)
    }

    func testDealCardsOfOneRound() {
        let players = [Player(), Player()]
        dealer.dealCardsOfOneRound(players)
    }
}
