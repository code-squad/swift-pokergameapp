import Foundation

struct TestGame {
    private var deck = CardDeck()
    
    public func count() {
        print("총 \(deck.count)의 카드가 있습니다.")
    }
    
    public func shuffle() {
        print("전체 \(deck.count)의 카드를 섞었습니다.")
    }
    
    mutating public func popCard() {
        guard let card = deck.removeOne() else {
            print("카드가 남아있지 않습니다 카드를 초기화해주세요")
            return
        }
        print("\(card)\n총\(deck.count)의 카드가 남아있습니다.")
    }
    
    mutating public func resetDeck() {
        print("deck을 다시 구성했습니다.")
        deck.reset()
    }
}
