import Foundation

protocol Player {
    var role: String { get }
    var cards: [Card] { get }
    func recieveCard(newCard: Card)
}
