import Foundation

class Player {
    private var handDeck:[Card]
    
    init() {
        self.handDeck = [Card]()
    }
    
    func recieveCard(card: Card) {
        self.handDeck.append(card)
    }
}

/*
 extension을 사용하면 class 내부에 cumtomstringconvertible 프로토콜 쓰는 것보다 가독성에서 이점이 있을 것 같았는데
 가독성 측면에서 크게 이점이 있는지 모르겠음 => 여러 프로토콜을 채택할 경우에는 다를 수도 있을 것 같은데...
*/

extension Player:CustomStringConvertible {
    var description: String {
        return "\(self.handDeck)"
    }
}
