import Foundation

class Dealer {
    private var cardDeck:CardDeck
    private var handDeck:[Card] // 딜러가 들고 있을 카드덱
    
    init() {
        self.cardDeck = CardDeck()
        self.handDeck = [Card]()
        self.cardDeck.shuffle() // 셔플은 딜러의 역할
    }
    
    //각 참가자(player)에게 카드를 한 장씩 돌림
    func deal() -> Card? {
        return self.cardDeck.removeOne()
    }
}
