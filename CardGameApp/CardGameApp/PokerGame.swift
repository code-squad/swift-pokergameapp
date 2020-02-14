import Foundation

class PokerGame {
    var participants = [Participant]()
    var dealer = Dealer()
    var cardsCount: Int
    var participantCount: Int
    
    init(gameMode: Mode.GameMode, playerMode: Mode.PlayerMode) {
        cardsCount = gameMode.rawValue
        participantCount = playerMode.rawValue
        
        for count in 0..<participantCount {
            participants.append(Participant())
            participants[count].role += "#\(count+1)"
        }
    }
    
    func giveCards() {
        
    }
}
