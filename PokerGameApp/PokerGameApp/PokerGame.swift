import Foundation

class PokerGame {
    private var dealer: Dealer
    private var players: Players
    private var stud: CardStud
    private var participants: Participants
    
    init(stud: CardStud, participants: Participants) {
        self.dealer = Dealer()
        self.players = Players()
        self.stud = .seven
        self.participants = .four
    }
    
    enum CardStud:Int {
        case seven = 7
        case five = 5
    }
    
    enum Participants: Int {
        case one = 1, two, three, four
    }
}
