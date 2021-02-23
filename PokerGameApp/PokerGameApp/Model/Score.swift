import Foundation

enum Score: Comparable {
    case onePair(Card.Rank)
    case twoPair(Card.Rank)
    case triple(Card.Rank)
    case straight(Card.Rank)
    case fourCard(Card.Rank)
    case none
}
