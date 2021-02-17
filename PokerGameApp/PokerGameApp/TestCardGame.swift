import Foundation

class TestCardGame {
    
    private var testCard = CardDeck()
    
    init() {
        resetCard()
        shuffleCard()
        removeCard()
        removeCard()
    }
    
    private func shuffleCard() {
        testCard.shuffle()
        print("전체 \(testCard.count())장의 카드를 섞었습니다.")
    }
    
    private func removeCard() {
        let pickCard = testCard.removeOne()
        if let result = pickCard {
            print("\(result)")
            print("총\(testCard.count())장의 카드가 남아있습니다.")
        } else {
            print("카드덱이 비었습니다.")
        }
    }
    
    private func resetCard() {
        testCard.reset()
        print("카드 전체를 초기화했습니다.")
        print("총 \(testCard.count())장의 카드가 있습니다.")
    }
}

