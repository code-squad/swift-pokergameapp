import Foundation

class Dealer: Player {
    private var cardDeck:CardDeck
    
    override init() {
        self.cardDeck = CardDeck()
        self.cardDeck.shuffle() // 셔플은 딜러의 역할
    }
    
    //각 참가자(player)에게 카드를 한 장씩 돌림
    func deal() -> Card? {
        return self.cardDeck.removeOne()
    }
}
