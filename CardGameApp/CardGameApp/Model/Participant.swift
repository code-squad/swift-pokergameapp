import Foundation

class Participant {
    private var role = ""
    private var cards = [Card]()
    
    func recieveCard(newCard: Card) {
        cards.append(newCard)
    }
    
    func giveRoleName(role: String) {
        return self.role += role
    }
    
    func statusOfRoleAndCards() -> (role: String, cards: [Card]) {
        return (self.role, self.cards)
    }
}
